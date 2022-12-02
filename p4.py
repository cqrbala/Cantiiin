import subprocess as sp
import pymysql
import pymysql.cursors
import inquirer
from pprint import pprint
from yaspin import yaspin
from yaspin.spinners import Spinners
import time
import pandas as pd
from tabulate import tabulate
from getpass import getpass
from datetime import date

def get_batch(year):

    year = int(year)
    today = date.today()
    curr_year = int(today.strftime("%Y"))
    curr_month = int(today.strftime("%-m"))
    if(curr_month >= 8):
        return f"UG-{curr_year - year + 1}"
    else:
        return f"UG-{curr_year - year}"

def spinner():
    with yaspin(Spinners.aesthetic,) as yp:
        time.sleep(1)

def handle_output(df):
    if len(df) == 0:
        print("No results were returned for your query")
    else:
        print(tabulate(df,headers="keys",tablefmt="pretty",showindex="never"))
    print()    

def clear():
    tmp = sp.call('clear',shell=True)


level1 = [
    inquirer.List(
        "Function",
        message="What do you want to do?",
        choices=["1. Update","2. Insert","3. Delete","4. Functional Queries","5. Exit"],
    ),
]

update = [
    inquirer.List(
        "Update",
        message="What do you want to update?",
        choices=["Student Preferences","Update Price"],
    ),
]

delete = [
    inquirer.List(
        "Delete",
        message="What do you want to Delete?",
        choices=["Student Record"],
    ),
]

insert = [
    inquirer.List(
        "Insert",
        message="In which table do you want to insert",
        choices=["Students","Adding new item to meal"],
    ),
]

functional = [
    inquirer.List(
        "Functional",
        message="Which functional capability would you like to use?",
        choices=[
        "Students who like Food Item",
        "Get information students of a particular batch",
        "Students registered at mess",
        "Canteens that accept a mode of payment",
        "List of Canteens that serve Non-Veg",
        "Most Expensive Item Sold at Canteen",
        "Search for a Food Item in Canteens",
        "Get order of food items by the number of likes",
        "Get the best bang for your buck",
        ],
    ),
]


def Canteen_Select():
    query = "Select Name from Canteens"
    cur.execute(query)
    
    canteen_list = [x['Name'] for x in cur.fetchall()]
    
    canteen = [
    inquirer.List(
        "Canteen",
        message="Select the name of the canteen",
        choices=canteen_list,
    ),

    ]
    answer = inquirer.prompt(canteen)["Canteen"]
    clear()
    return answer


programme = {
    "101":"CSE",
    "111":"CSD",
    "112":"ECD",
    "102":"ECE",
}



def UpdateStudent():
    """
    Function to Update student's preference list
    """
    try:
        Roll = input("Enter Roll Number of Student: ")
        M1 = input("First Mess Preference (Kadamb, Yuktahaar, North, South) : ")
        M2 = input("Second Mess Preference (Kadamb, Yuktahaar, North, South) : ")
        print("Enter New Canteen Preferences: ")
        C1 = Canteen_Select()
        C2 = Canteen_Select()

        query = f"UPDATE STUDENTS SET `Mess Preference 1`='{M1}',`Mess Preference 2`='{M2}', `Canteen Preference 1`='{C1}', `Canteen Preference 2`='{C2}' WHERE Roll_number='{Roll}'"

        cur.execute(query)
        con.commit()

        print("Records Updated")

    
    except Exception as e:

        con.rollback()
        print("Failed to update records")
        print(">>>>>>>>>>>>>", e)

    return

def InsertStudent():
    """
        This function is to insert records into the student table of the P4 database
    """
    try:
        # Takes student details as input
        row = {}
        print("Enter new student's details: ")
        row["name"] = input("Name: ")
        row["Roll"] = input("Roll Number: ")
        row["Batch"] = row["Roll"][0:4]
        row["Programme"] = row["Roll"][4:7]
        row["M1"] = input("First Mess Preference (Kadamb, Yuktahaar, North, South) : ")
        row["M2"] = input("Second Mess Preference (Kadamb, Yuktahaar, North, South) : ")
        print("Select first and Second Canteen Preference: ")
        row["C1"] = Canteen_Select()
        row["C2"] = Canteen_Select()

        # Forming the query
        query = "INSERT INTO STUDENTS(Name,Roll_number,`Mess Preference 1`, `Mess Preference 2`, `Canteen Preference 1`, `Canteen Preference 2`, Batch, Programme) VALUES('%s', '%s', '%s', '%s', '%s', '%s', '%s','%s')" %  (
            row["name"], row["Roll"], row["M1"], row["M2"], row["C1"], row["C2"], get_batch(row["Batch"]), programme[row["Programme"]])

        # Execueting the query
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        # If the query fails we roll back change and then print the error message from mysql
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def DeleteStudent():
    
    try:
        Roll = input("Enter Roll Number of Student: ")
        query = f"DELETE FROM STUDENTS WHERE Roll_number={Roll}"

        cur.execute(query)
        con.commit()
        print("Recorded Deleted")

    
    except Exception as e:

        con.rollback()
        print("Failed to delete Record")
        print(">>>>>>>>>>>>>", e)
    
    return

def InsertMealItem():
    try:
        Meal_id = input("Enter Meal_id: ")
        Item = input("Enter Name of item: ")

        query= f"insert into `Mess Food` (Meal_id,Food_item) VALUES ('{Meal_id}','{Item}')"

        cur.execute(query)
        con.commit()

        print("Inserted Into Database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

def UpdatePrice():
    try:
        Canteen = Canteen_Select()
        Item = input("Enter Item Name: ")
        Price = int(input("Enter new Price: "))

        query = f"Update `Canteens_Food Item` SET Price={Price} WHERE Canteens_Name='{Canteen}' AND `Food Item_Name`='{Item}'"

        cur.execute(query)
        con.commit()

        print("Records Updated")

    except Exception as e:

        con.rollback()
        print("Failed to update records")
        print(">>>>>>>>>>>>>", e)


# Functional Queries
def StudentsLikes():
    """
    Gets the list of students who like a particular food item at a 
    """
    try:
        Item = input("Food Item name: ")
        Canteen = Canteen_Select()

        query = f"select S.Name, S.Roll_number from Students as S, `Likes, Sold By` as L WHERE S.Roll_number=L.Student_id AND L.Item_name = '{Item}' AND L.Canteen_Name = '{Canteen}'"

        cur.execute(query)
        df = pd.DataFrame.from_dict(cur.fetchall())
        handle_output(df)


    except Exception as e:
        
        print("Failed to execute query: ")
        print(">>>>>>>>>>>>>", e)

def StudentsBatch():
    
    try:
        Batch = input("Enter Batch: ")

        query = f"Select Name,Roll_Number,`Mess Preference 1`, `Canteen Preference 1` from Students WHERE Batch='{Batch}'"

        cur.execute(query)
        df=pd.DataFrame.from_dict(cur.fetchall())
        handle_output(df)

    except Exception as e:

        print("Failed to execute query: ")
        print(">>>>>>>>>>>>>", e)

def StudentsMess():
    try:
        Mess = input("Enter Mess: ")

        query = f" select DISTINCT R.Student_id,S.Name from `Registered at Mess, To eat (Relation)` as R, Students as S WHERE S.Roll_number=R.Student_id AND Mess_name='{Mess}'"
        
        cur.execute(query)
        df=pd.DataFrame.from_dict(cur.fetchall())
        handle_output(df)

    except Exception as e:

        print("Failed to execute query: ")
        print(">>>>>>>>>>>>>", e)

def CanteenPayment():
    try:
        Mode = input("Enter Mode of Payment: ")

        query = f"select Canteen_Name from `Payment methods - Canteen` where Mode_of_Payment='{Mode}'"
        
        cur.execute(query)
        df=pd.DataFrame.from_dict(cur.fetchall())
        handle_output(df)

    except Exception as e:

        print("Failed to execute query: ")
        print(">>>>>>>>>>>>>", e)

def CanteenNonVeg():
    try:
        
        query = f"select Name,Location from Canteens WHERE `Serves Non-Veg`=1"
        
        cur.execute(query)
        df=pd.DataFrame.from_dict(cur.fetchall())
        handle_output(df)

    except Exception as e:

        print("Failed to execute query: ")
        print(">>>>>>>>>>>>>", e)

def ExpensiveCanteen():
    try:
        Canteen = Canteen_Select()
        query = f" select Canteens_Name,`Food Item_Name`,Price from `Canteens_Food Item` WHERE Canteens_Name='{Canteen}' ORDER BY Price DESC LIMIT 1;"
        
        cur.execute(query)
        df=pd.DataFrame.from_dict(cur.fetchall())
        handle_output(df)

    except Exception as e:

        print("Failed to execute query: ")
        print(">>>>>>>>>>>>>", e)

def FoodSearch():
    
    try:
        Search = input("Enter Search term: ")
        query = f" select * from `Canteens_Food Item` WHERE `Food Item_Name` LIKE '%{Search}%'"
        
        cur.execute(query)
        df=pd.DataFrame.from_dict(cur.fetchall())
        handle_output(df)

    except Exception as e:

        print("Failed to execute query: ")
        print(">>>>>>>>>>>>>", e)

def FoodLikeOrder():
    try:
        query = f"select Canteen_name,Item_name, Count(*)  from `Likes, Sold By` GROUP BY Canteen_name,Item_name ORDER BY COUNT(*) DESC;"
        
        cur.execute(query)
        df=pd.DataFrame.from_dict(cur.fetchall())
        handle_output(df)

    except Exception as e:

        print("Failed to execute query: ")
        print(">>>>>>>>>>>>>", e)

def BangForYourBuck():

    try:
        Amount = int(input("Enter the Amount you're willing to spend:"))
        canteen_item = [] # list of a lists that each contain both the canteen name and the food item
        cost = [] # list that stores the price of each item
        likes=[]

        # Now we have to collect the data to run 0-1 knapsack
        query = "select * from `Canteens_Food Item`"
        cur.execute(query)
        result = cur.fetchall()

        canteen_item = [[x["Canteens_Name"],x["Food Item_Name"]] for x in result]
        cost = [x["Price"] for x in result]
        likes = [1 for x in result]

        # Now have to check the likes

        query = "select Canteen_name,Item_name, Count(*)  from `Likes, Sold By` GROUP BY Canteen_name,Item_name ORDER BY COUNT(*) DESC"
        cur.execute(query)
        result = cur.fetchall()

        for i in range(len(result)):
            x = result[i]
            for j in range(len(canteen_item)):
                if [x["Canteen_name"],x["Item_name"]] == canteen_item[j]:
                    likes[j] = x["Count(*)"] + 1
                    break
        
        # Now to implement 0-1 knapsack dp
        dp = [[0 for x in range(Amount+1)] for x in range(len(canteen_item)+1)] 

        for i in range(len(canteen_item)+1):
            for w in range(Amount + 1):
                if i == 0 or w == 0:
                    dp[i][w] = 0 
                elif cost[i-1] <= w:
                    dp[i][w] = max(likes[i-1]
                            + dp[i-1][w-cost[i-1]], 
                            dp[i-1][w])   
                else:
                    dp[i][w] = dp[i-1][w] 
        
        result = dp[len(canteen_item)][Amount]
        # Now to get the sequence of items involved
        seq = []

        w = Amount
        res = result

        i = len(canteen_item)
        while(i>0 and res > 0):
            if(res == dp[i-1][w]):
                i -= 1
                continue
            else:
                seq.append(i-1)
                res = res - likes[i - 1];
                w = w - cost[i - 1];
                i -= 1

        final_items = [canteen_item[x] for x in seq]
        spent = sum([cost[x] for x in seq])

        df = pd.DataFrame(final_items,columns=["Canteen","Food Item"])
        handle_output(df)
        print(f"Total amount spent = {spent}")
        print()
            
    
    except Exception as e:

        print("Failed to execute query: ")
        print(">>>>>>>>>>>>>", e)


# Routing functions
def Update():
    answer = inquirer.prompt(update)["Update"]
    tmp = sp.call('clear', shell=True)
    if(answer=="Student Preferences"):
        UpdateStudent()
    elif(answer=="Update Price"):
        UpdatePrice()

def Delete():
    answer = inquirer.prompt(delete)["Delete"]
    tmp = sp.call('clear', shell=True)
    if(answer=="Student Record"):
        DeleteStudent()

def Insert():
    answer = inquirer.prompt(insert)["Insert"]
    tmp = sp.call('clear', shell=True)
    if(answer=="Students"):
        InsertStudent()
    elif(answer=="Adding new item to meal"):
        InsertMealItem()

def Functional():
    answer = inquirer.prompt(functional)["Functional"]
    tmp = sp.call('clear', shell=True)
    if(answer=="Students who like Food Item"):
        StudentsLikes()
    elif(answer=="Get information students of a particular batch"):
        StudentsBatch()
    elif(answer=="Students registered at mess"):
        StudentsMess()
    elif(answer=="Canteens that accept a mode of payment"):
        CanteenPayment()
    elif(answer=="List of Canteens that serve Non-Veg"):
        CanteenNonVeg()
    elif(answer=="Most Expensive Item Sold at Canteen"):
        ExpensiveCanteen()
    elif(answer=="Search for a Food Item in Canteens"):
        FoodSearch()
    elif(answer=="Get order of food items by the number of likes"):
        FoodLikeOrder()
    elif(answer=="Get the best bang for your buck"):
        BangForYourBuck()
    
    

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        Update()
    elif(ch == 2):
        Insert()
    elif(ch == 3):
        Delete()
    elif(ch == 4):
        Functional()
    


# Global
tmp = input("ENTER ANY KEY TO START: ")

spinner()

while(1):
    tmp = sp.call('clear', shell=True)
    
    p = getpass()
    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="root",
                              password=p,
                              db='P4',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)



        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")
        


        tmp = input("Enter any key to CONTINUE >>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                answers = inquirer.prompt(level1)
                ch = int(answers["Function"].split(" ")[0][0]);
                tmp = sp.call('clear', shell=True)
                if ch == 5:
                    tmp = sp.call('clear',shell=True)
                    print("Thanks for coming. Good Bye")
                    spinner()
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")


