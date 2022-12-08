#Red circles require replace with function instead of print
import sqlite3
from sqlite3 import Error


def openConnection(_dbFile):

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
    except Error as e:
        print(e)

    return conn


def closeConnection(_conn, _dbFile):

    try:
        _conn.close()
    except Error as e:
        print(e)


def modification(_conn, _items, _setMod):

    table = []
    isNumber = []
    tableName = ""
    commaClause = ""
    query = ""
    queryMod = ""


    if _items[0] == "1":   
        table = ["g_id", "u_name", "u_id", "u_age", "u_password", "u_email"]
        isNumber = [True, False, True, True, False, False]
        tableName = "UserPurchases"
        queryMod = table[2]

    elif _items[0] == "2":
        table = ["d_id", "pub_id", "d_name", "d_ceo ", "d_est", "d_dest", "d_location"]
        isNumber = [True, True, False, False, True, True, False]
        tableName = "Developer"
        queryMod = table[0]

    elif _items[0] == "3":
        table = ["pub_id", "p_name", "p_ceo ", "p_est", "p_dest", "p_location"]
        isNumber = [True, False, False, True, True, False]
        tableName = "Publisher"
        queryMod = table[0]

    elif _items[0] == "4":
        table = ["g_id", "r_id", "pl_id", "disest_date", "g_name", "g_price", "g_length", "g_genre", "g_releasedate"]
        isNumber = [True, True, True, True, False, True, True, False, True]
        tableName = "Game"
        queryMod = table[0]

    elif _items[0] == "5":
        table = ["r_id ", "r_NA", "r_EU", "r_Asia"]
        isNumber = [True, False, False, False]
        tableName = "Rating"
        queryMod = table[0]

    elif _items[0] == "6":
        table = ["pl_id", "p_name", "p_os", "p_type"]
        isNumber = [True, False, False, False]
        tableName = "Platform"
        queryMod = table[0]


    count = 0
    itemsLength = len(_items)
    for x in range(itemsLength):
        if x in [0]:
            continue
        else:
            if _items[x] != "":
                count += 1


    if count > 1:
        commaClause = ", "


    _itemsLength = len(_items)
    for x in range(_itemsLength):
        if x == 0:
            _items[0] = "'" + _items[x] + "'" 
        else: 
            if _items[x] == "":
                continue
            elif isNumber[x - 1] == True:
                itemQuery = " = " + _items[x]
                query = query + commaClause + table[x - 1] + itemQuery
            elif _items[x] == "NULL":
                itemQuery = " IS " + _items[x]
                query = query + commaClause + table[x - 1] + itemQuery
            else:
                itemQuery = " = " + "'" + _items[x] + "' "
                query = query + commaClause + table[x - 1] + itemQuery
        if x == _itemsLength - 1 and count > 1:
            query = query.split(' ', 1)[1]

    try:
        sql = f"""UPDATE 
                    {tableName}
                SET 
                    {query}
                WHERE 
                    {queryMod} = {_setMod}"""
                    
        cur = _conn.cursor()
        cur.execute(sql)

    except Error as e:
        print(e)


def deletion(_conn, _items): 

    table = []
    isNumber = []
    tableName = ""
    andClause = ""
    query = ""


    if _items[0] == "1":   
        table = ["g_id", "u_name", "u_id", "u_age", "u_password", "u_email"]
        isNumber = [True, False, True, True, False, False]
        tableName = "UserPurchases"

    elif _items[0] == "2":
        table = ["d_id", "pub_id", "d_name", "d_ceo ", "d_est", "d_dest", "d_location"]
        isNumber = [True, True, False, False, True, True, False]
        tableName = "Developer"

    elif _items[0] == "3":
        table = ["pub_id", "p_name", "p_ceo ", "p_est", "p_dest", "p_location"]
        isNumber = [True, False, False, True, True, False]
        tableName = "Publisher"

    elif _items[0] == "4":
        table = ["g_id", "r_id", "pl_id", "d_id", "g_name", "g_price", "g_length", "g_genre", "g_releasedate"]
        isNumber = [True, True, True, True, False, True, True, False, True]
        tableName = "Game"

    elif _items[0] == "5":
        table = ["r_id ", "r_NA", "r_EU", "r_Asia"]
        isNumber = [True, False, False, False]
        tableName = "Rating"

    elif _items[0] == "6":
        table = ["pl_id", "p_name", "p_os", "p_type"]
        isNumber = [True, False, False, False]
        tableName = "Platform"


    count = 0
    itemsLength = len(_items)
    for x in range(itemsLength):
        if x in [0]:
            continue
        else:
            if _items[x] != "":
                count += 1


    if count > 1:
        andClause = "AND "


    _itemsLength = len(_items)
    for x in range(_itemsLength):
        if x == 0:
            _items[0] = "'" + _items[x] + "'"  
        else: 
            if _items[x] == "":
                continue
            elif isNumber[x - 1] == True:
                itemQuery = " = " + _items[x]
                query = query + andClause + table[x - 1] + itemQuery
            elif _items[x] == "NULL":
                itemQuery = " IS " + _items[x]
                query = query + andClause + table[x - 1] + itemQuery
            else:
                itemQuery = " = " + "'" + _items[x] + "' "
                query = query + andClause + table[x - 1] + itemQuery
        if x == _itemsLength - 1 and count > 1:
            query = query.split(' ', 1)[1]

    try:
        sql = f"""DELETE
                FROM
                    {tableName}
                WHERE
                    {query}"""
                    
        cur = _conn.cursor()
        cur.execute(sql)

    except Error as e:
        print(e)



def insertion(_conn, _items):

    _itemsLength = len(_items)
    for x in range(_itemsLength):
        if _items[x] == "":
            _items[x] = None
    

    if _items[0] == "1":
        try:
            UserPurchases = [
                (_items[1], _items[2], _items[3], _items[4], _items[5], _items[6])
            ]
            sql = "INSERT INTO UserPurchases VALUES(?,?,?,?,?,?)"
            _conn.executemany(sql, UserPurchases)

            _conn.commit()

        except Error as e:
            _conn.rollback()
            print(e)

    elif _items[0] == "3":
        try:
            Publisher = [
                (_items[1], _items[2], _items[3], _items[4], _items[5], _items[6])
            ]
            sql = "INSERT INTO Publisher VALUES(?,?,?,?,?,?)"
            _conn.executemany(sql, Publisher)

            _conn.commit()
        except Error as e:
            _conn.rollback()
            print(e)

    elif _items[0] == "2":
        try:
            Developer = [
                (_items[1], _items[2], _items[3], _items[4], _items[5], _items[7], _items[8]), 
            ]
            sql = "INSERT INTO Developer VALUES(?,?,?,?,?,?,?)"
            _conn.executemany(sql, Developer)

            _conn.commit()

        except Error as e:
            _conn.rollback()
            print(e)

    elif _items[0] == "4":
        try:
            Game = [
                (_items[1], _items[2], _items[3], _items[4], _items[5], _items[6], _items[7], _items[8], _items[9])
            ]
            sql = "INSERT INTO Game VALUES(?,?,?,?,?,?,?,?,?)"
            _conn.executemany(sql, Game)

            _conn.commit()

        except Error as e:
            _conn.rollback()
            print(e)

    elif _items[0] == "5":
        try:
            Rating = [
                (_items[1], _items[2], _items[3], _items[4])
            ]
            sql = "INSERT INTO Platform VALUES(?,?,?,?)"
            _conn.executemany(sql, Rating)

            _conn.commit()

        except Error as e:
            _conn.rollback()
            print(e)

    elif _items[0] == "6":
        try:
            Platform = [
                (_items[1], _items[2], _items[3], _items[4])
            ]
            sql = "INSERT INTO Platform VALUES(?,?,?,?)"
            _conn.executemany(sql, Platform)

            _conn.commit()

        except Error as e:
            _conn.rollback()
            print(e)


def searching(_conn, _game, _price, _rate, _genre, _dev, _pub, _plat, _year):
    
    tempList = [_game, _price, _rate, _genre, _dev, _pub, _plat, _year]
    arrLength = len(tempList)

    gameQuery = ""
    priceQuery = ""
    ratingQuery = ""
    genreQuery = ""
    devQuery = ""
    publishQuery = ""
    platQuery = ""
    yearQuery = ""

    rating = ""
    andClause = ""

    count = 0
    for x in range(arrLength):
        if tempList[x] != "":
            count += 1


    if count >= 1:
        andClause = " AND "


    if _game != "":
        gameStr = "'" + _game + "'"
        gameQuery = andClause + "G.g_name = " + gameStr
    

    if _price != "":
        price = float(_price)
        priceQuery = andClause + "G.g_price = "
    elif _price == "":
        price = ""


    if _rate != "":

        if _rate == "E" or _rate == "E10+" or _rate == "T" or _rate == "M":
            rating = "r_NA"

        elif _rate == "3+" or _rate == "12+" or _rate == "16+" or _rate == "18+":
            rating = "r_EU"

        elif _rate == "G" or _rate == "PG 12+" or _rate == "PG 15+" or _rate == "R 18+":
            rating = "r_Asia"

        rateStr = "'" + _rate + "'"
        ratingQuery = andClause + rating + " = " + rateStr

    elif _rate == "":
        rating = "r_NA"


    if _genre != "":
        genreStr = "'" + _genre + "'"
        genreQuery = andClause + "G.g_genre = " + genreStr


    if _dev != "":
        devStr = "'" + _dev + "'"
        devQuery = andClause + "D.d_dev = " + devStr


    if _pub != "":
        pubStr = "'" + _pub + "'"
        publishQuery = andClause + "PU.p_name = " + pubStr

    if _plat != "":
        platStr = "'" + _plat + "'"
        platQuery = andClause + "PL.p_name = " + platStr


    if _year != "":
        year = int(_year)
        yearQuery = andClause + "G.g_releasedate = "
    elif _year == "":
        year = ""

    try:
        sql = f"""SELECT 
                    G.g_name, G.g_price, R.'{rating}', G.g_genre, D.d_name, PU.p_name, PL.p_name, G.g_releasedate
                FROM
                    Game G, Rating R, Platform PL, Publisher PU, Developer D
                WHERE
                    G.r_id = R.r_id AND G.pl_id = PL.pl_id AND G.d_id = D.d_id AND D.pub_id = PU.pub_id  
                    {gameQuery}
                    {priceQuery} {price}
                    {ratingQuery}
                    {genreQuery}
                    {devQuery} 
                    {publishQuery}
                    {platQuery}
                    {yearQuery} {year}"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        print("\n")
        l = '{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}'.format("Game", " | ", "Price", " | ", "Rating", " | ", "Genre", " | ", "Developer", " | ", "Publisher", " | ", "Platform", " | ", "Release Year")
        print(l)

        rows = cur.fetchall()
        for row in rows:
            ll = '{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}'.format(row[0], " | ", row[1], " | ", row[2], " | ", row[3], " | ", row[4], " | ", row[5], " | ", row[6], " | ", row[7])
            print(ll)

    except Error as e:
        print(e)



def insert():
    database = r"db.sqlite"
    conn = openConnection(database)
    with conn:
        while True:
            print("\nWhat type of information would you like to insert?")
            print("1) UserPurchases data")
            print("2) Developer data")
            print("3) Publisher data")
            print("4) Game data")
            print("5) Rating data")
            print("6) Platform data")
            
            Selection=input("Selection:  ")

            # New User 
            if Selection=="1":
                print("\nPlease Enter the details you wish to insert. Press 'Enter' to skip")
                User=["1"]
                User.append(input("Game ID:"))
                User.append(input("Name: "))
                User.append(input("User's ID: "))
                User.append(input("User's Age: "))
                User.append(input("User's Password: "))
                User.append(input("User's Email: "))

                insertion(conn, User)
                break

            #New Developer
            elif Selection=="2":
                print("\nPlease Enter the details you wish to insert. Press 'Enter' to skip")

                Developer=["2"]
                Developer.append(input("Developer ID: "))
                Developer.append(input("Publisher ID: "))
                Developer.append(input("Developer Name: "))
                Developer.append(input("Developer CEO: "))
                Developer.append(input("Developer's Established Date: "))
                Developer.append(input("Developer's Destablish Date: "))
                Developer.append(input("Developer's Location: "))

                insertion(conn, Developer)
                break

            #New Publisher
            elif Selection=="3":
                print("\nPlease Enter the details you wish to insert. Press 'Enter' to skip")

                Publisher=["3"]
                Publisher.append(input("Publisher ID: "))
                Publisher.append(input("Publisher Name: "))
                Publisher.append(input("Publisher CEO: "))
                Publisher.append(input("Publisher's Established Date: "))
                Publisher.append(input("Publisher's Destablished Date: "))
                Publisher.append(input("Publisher Location : "))

                insertion(conn, Publisher)
                break

            #new Game
            elif Selection=="4":
                print("\nPlease Enter the details you wish to insert. Press 'Enter' to skip")
                
                Game=["4"]
                Game.append(input("Game ID: "))
                Game.append(input("Game Rating: "))
                Game.append(input("Platform ID: "))
                Game.append(input("Developer ID: "))
                Game.append(input("Game Name: "))
                Game.append(input("Game Price: "))
                Game.append(input("Game Length: "))
                Game.append(input("Game genre: "))
                Game.append(input("Game Releasedate: "))

                insertion(conn, Game)
                break

            elif Selection=="5":
                print("\nPlease Enter the details you wish to insert. Press 'Enter' to skip")
                
                Rating=["5"]
                Rating.append(input("RatingID: "))
                Rating.append(input("NA Rating : "))
                Rating.append(input("EU Rating: "))
                Rating.append(input("Asia Rating: "))

                insertion(conn, Rating)
                break
            
            elif Selection=="6":
                print("\nPlease Enter the details you wish to insert. Press 'Enter' to skip")

                Platform=["6"]
                Platform.append(input("Platform ID: "))
                Platform.append(input("Platform Name: "))
                Platform.append(input("Platform OperatingSystem: "))
                Platform.append(input("Main Platform: "))

                insertion(conn, Platform)
                break
            
            else:
                print("Please enter a valid command:")


#ALL user inputs are the NAMES of the selected output
#I.E: Name of user, Develeor Name, PublisherName, Game Name
def delete():
    database = r"db.sqlite"
    conn = openConnection(database)
    with conn:
        while True:
            print("\nWhat type of data do you wish to delete?")
            print("1) UserPurchase data")
            print("2) Developer data")
            print("3) Publisher data")
            print("4) Game data")
            print("5) Rating data")
            print("6) Platform data")
            
            Selection=input("Selection:  ")
            # Delete User 
            if Selection=="1":
                print("\nPlease Enter the following details on the user purchase information you wish to delete.")
                User=["1"]
                User.append(input("Game ID:"))
                User.append(input("Name: "))
                User.append(input("User's ID: "))
                User.append(input("User's Age: "))
                User.append(input("User's Password: "))
                User.append(input("User's Email: "))

                deletion(conn, User)
                break
            #Delete Developer
            elif Selection=="2":
                print("\nPlease Enter the following details on the developer you wish to delete.")
                Developer=["2"]
                Developer.append(input("Developer ID: "))
                Developer.append(input("Publisher ID: "))
                Developer.append(input("Developer Name: "))
                Developer.append(input("Developer CEO: "))
                Developer.append(input("Developer's Established Date: "))
                Developer.append(input("Developer's Destablish Date: "))
                Developer.append(input("Developer's Location: "))

                deletion(conn, Developer)
                break
            #Delete Publisher
            elif Selection=="3":
                print("\nPlease Enter the following details on the publisher you wish to delete.")

                Publisher=["3"]
                Publisher.append(input("Publisher ID: "))
                Publisher.append(input("Publisher Name: "))
                Publisher.append(input("Publisher CEO: "))
                Publisher.append(input("Publisher's Established Date: "))
                Publisher.append(input("Publisher's Destablished Date: "))
                Publisher.append(input("Publisher Location : "))

                deletion(conn, Publisher)
                break
            #Delete Game
            elif Selection=="4":
                print("\nPlease Enter the following details on the game you wish to delete.")
            
                Game=["4"]
                Game.append(input("Game ID: "))
                Game.append(input("Game Rating: "))
                Game.append(input("Platform ID: "))
                Game.append(input("Developer ID: "))
                Game.append(input("Game Name: "))
                Game.append(input("Game Price: "))
                Game.append(input("Game Length: "))
                Game.append(input("Game genre: "))
                Game.append(input("Game Releasedate: "))
                deletion(conn, Game)
                break

            elif Selection=="5":
                print("\nPlease Enter the following details on the rating you wish to delete.")
                
                Rating=["5"]
                Rating.append(input("RatingID: "))
                Rating.append(input("NA Rating : "))
                Rating.append(input("EU Rating: "))
                Rating.append(input("Asia Rating: "))

                deletion(conn, Rating)

            elif Selection=="6":
                print("\nPlease Enter the following details on the platform you wish to delete.")
                Platform=["6"]
                Platform.append(input("Platform ID: "))
                Platform.append(input("Platform Name: "))
                Platform.append(input("Platform OperatingSystem: "))
                Platform.append(input("Main Platform: "))

                deletion(conn, Platform)
            else:
                print("Please enter a valid command:")



def Game_Modify():
    database = r"db.sqlite"
    conn = openConnection(database)
    with conn:
        print("\nEnter the Game id of the game you wish to modify")
        Modify=input("Selection:  ")
        print("\nPlease Enter the following details you wish to modify. Press Enter to skip")
        Game=["4"]
        Game.append(input("Game ID: "))
        Game.append(input("Game Rating: "))
        Game.append(input("Platform ID: "))
        Game.append(input("Developer ID: "))
        Game.append(input("Game Name: "))
        Game.append(input("Game Price: "))
        Game.append(input("Game Length: "))
        Game.append(input("Game genre: "))
        Game.append(input("Game Releasedate: "))

        
        modification(conn, Game, Modify)
        
def PublisherModify():
    database = r"db.sqlite"
    conn = openConnection(database)
    with conn:
        print("\nEnter the Publisher id of the publisher you wish to modify")
        Modify=input("Selection:  ")
        print("\nPlease Enter the following details you wish to modify. Press Enter to skip")
        Publisher=["2"]
        Publisher.append(input("Publisher ID: "))
        Publisher.append(input("Publisher Name: "))
        Publisher.append(input("Publisher CEO: "))
        Publisher.append(input("Publisher's Established Date: "))
        Publisher.append(input("Publisher's Destablished Date: "))
        Publisher.append(input("Publisher Location : "))

        modification(conn, Publisher, Modify)

def DeveloperModify():
    database = r"db.sqlite"
    conn = openConnection(database)
    with conn:
        print("\nEnter the Developer id of the developer you wish to modify")
        Modify=input("Selection:  ")
        print("\nPlease Enter the following details you wish to modify. Press Enter to skip")

        Developer=["3"]
        Developer.append(input("Developer ID: "))
        Developer.append(input("Publisher ID: "))
        Developer.append(input("Developer Name: "))
        Developer.append(input("Developer CEO: "))
        Developer.append(input("Developer's Established Date: "))
        Developer.append(input("Developer's Destablish Date: "))
        Developer.append(input("Developer's Location: "))

        modification(conn, Developer, Modify)

def UserModify():
    database = r"db.sqlite"
    conn = openConnection(database)
    with conn:
        print("\nEnter the User id of the User you wish to modify")
        Modify=input("Selection:  ")
        print("\nPlease Enter the following details you wish to modify. Press Enter to skip")

        User=["1"]
        User.append(input("Game ID:"))
        User.append(input("Name: "))
        User.append(input("User's ID: "))
        User.append(input("User's Age: "))
        User.append(input("User's Password: "))
        User.append(input("User's Email: "))

        modification(conn, User, Modify)

def RatingModify():
    database = r"db.sqlite"
    conn = openConnection(database)
    with conn:
        print("\nEnter the Rating id of the rating you wish to modify")
        Modify=input("Selection:  ")
        print("\nPlease Enter the following details you wish to modify. Press Enter to skip")

        Rating=["5"]
        Rating.append(input("RatingID: "))
        Rating.append(input("NA Rating: "))
        Rating.append(input("EU Rating: "))
        Rating.append(input("Asia Rating: "))
        modification(conn, Rating, Modify)

def PlatformModify():
    database = r"db.sqlite"
    conn = openConnection(database)
    with conn:
        print("\nEnter the Platform id of the platform you wish to modify")
        Modify=input("Selection:  ")
        print("\nPlease Enter the following details you wish to modify. Press Enter to skip")
        Platform=["6"]
        Platform.append(input("Platform ID: "))
        Platform.append(input("Platform Name: "))
        Platform.append(input("Platform OperatingSystem: "))
        Platform.append(input("Main Platform: "))
        modification(conn, Platform, Modify)

def Modify():
    while True:
    
        print("\nWhat would you like to modify?")
        print("1) User data")
        print("2) Publisher data")
        print("3) Developer data")
        print("4) Game data")
        print("5) Rating data")
        print("6) Platform data")
        selection=input("Selection:  ")

        if selection=="4":
            Game_Modify()
            break
        elif selection=="2":
            PublisherModify()
            break
        elif selection=="3":
            DeveloperModify()
            break
        elif selection=="1":
            UserModify()
            break
        elif selection=="5":
            RatingModify()
            break
        elif selection=="6":
            PlatformModify()
            break
        else:
            print("\nPlease enter a valid command:")

def search():

    database = r"db.sqlite"
    conn = openConnection(database)
    with conn:

        # Create three options, search for Game: Publisher:Developer
        while True:
            
                print("\nPlease Enter the following Game details you wish to filter. Press 'Enter' to skip")
                _game = input("Game Title: ")
                _price = input("Game Price: ")
                _rate = input("Game Rating: ")
                _genre = input("Game Genre: ")
                _dev = input("Game Dev: ")
                _pub = input("Game Pub: ")
                _plat = input("Game Plateform: ")
                _year = input("Game ReleaseDate: ")

                searching(conn,_game,_price,_rate,_genre,_dev,_pub,_plat,_year)
                break


def AdminTools():  
    
    count=0
    password="Test"
    # Asks for password, if wrong 3 times kicks user from program
    while True:
        print("\nPlease enter the Admin Password")
        PasswordInput=input("Selection:  ")

        if PasswordInput==password:
            print("\nSuccessfull Password")
            break
        elif count==3:
            print("To many failed attempts, shutting off program.")
            return 0
        else:
            count+=1
            print("Wrong password please try again. You have",4-count," more tries remaining")
    
    #User Inputed correct password and function continues
    while True:
        print("What would you like to do?")
        print("1) Insert")
        print("2) Delete")
        print("3) Modify")
       
        selection=input("Selection:  ")

        #Insert
        if selection=="1":
            insert()
            break
        #Delete
        elif selection=="2":
            delete()
            break
        #modify
        elif selection=="3":
            Modify()
            break
        #Customer information
      
        else:
            print("Please enter a valid command:")
        


def main():

        #All while statements are used to catch invalid Inputs and restart from the begining until user gets it right
        while True:
            print("\nWelcome to the GameLibrary, please select the approprite number for your use!")
            print("1) Search for a Specific Game" )  
            print("2) Administrative tools")

            selection=input("Selection:  ")
            #User Picks search
            if selection == "1":
                search()
                break
            #user picks ADministrative tools
            elif selection=="2":
                AdminTools()
                break
            else:
                print("Please enter a valid command:")
                    
if __name__ == "__main__":
    main()