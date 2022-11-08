import sqlite3
from sqlite3 import Error

def openConnection(_dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Open database: ", _dbFile)

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

    return conn


def closeConnection(_conn, _dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def dropTable(_conn):
    print("+++++++++++++++++++")
    print("Dropping tables")

    _conn.execute("BEGIN")
    try:
        sql = "DROP Table UserPurchases"
        _conn.execute(sql)

        sql = "DROP Table Game"
        _conn.execute(sql)

        sql = "DROP Table Rating"
        _conn.execute(sql)

        sql = "DROP Table Platform"
        _conn.execute(sql)

        sql = "DROP Table Publisher"
        _conn.execute(sql)

        sql = "DROP Table Developer"
        _conn.execute(sql)

        _conn.execute("COMMIT")
        print("Successlly dropped tables")
    except Error as e:
        _conn.execute("ROLLBACK")
        print(e)

    print("+++++++++++++++++++")


def createTable(_conn):
    print("+++++++++++++++++++")
    print("Recreating tables")

    _conn.execute("BEGIN")
    try:
        sql = """CREATE TABLE Game (
                g_id int(10) NOT NULL,
                r_id int(10) NOT NULL,
                pl_id int(10) NOT NULL,
                d_id int(10) NOT NULL,
                g_name varchar(50) NOT NULL ,
                g_price DECIMAL(4,2) NOT NULL,
                g_length DECIMAL(4,2) NOT NULL,
                g_genre varchar(50) NOT NULL,
                g_releasedate int(50) NOT NULL)"""
        _conn.execute(sql)

        sql = """CREATE TABLE UserPurchases (
                g_id int(10) NOT NULL,
                u_name varchar(50) NOT NULL,
                u_id int(5) NOT NULL,
                u_age int(2) NOT NULL,
                u_password varchar(50) NOT NULL,
                u_email varchar(50) NOT NULL)"""
        _conn.execute(sql)

        sql = """CREATE TABLE Rating (
                r_id int(10) PRIMARY KEY,
                r_NA varchar(50) NOT NULL,
                r_EU varchar(50) NOT NULL,
                r_Asia varchar(50) NOT NULL)"""
        _conn.execute(sql)

        sql = """CREATE TABLE Platform (
                pl_id int(10) PRIMARY KEY,
                p_name varchar(50) NOT NULL,
                p_os varchar(50) NOT NULL,
                p_type varchar(50) NOT NULL)"""
        _conn.execute(sql)

        sql = """CREATE TABLE Publisher (
                pub_id int(10) PRIMARY KEY,
                p_name varchar(50) NOT NULL,
                p_ceo varchar(50),
                p_est int(4),
                p_dest int(4),
                p_location varchar(50))"""
        _conn.execute(sql)

        sql = """CREATE TABLE Developer (
                d_id int(10) PRIMARY KEY,
                pub_id int(10) NOT NULL,
                d_name varchar(50) NOT NULL ,
                d_ceo varchar(50) NOT NULL,
                d_est int(4) NOT NULL,
                d_dest int(4),
                d_location varchar(50) NOT NULL)"""
        _conn.execute(sql)

        _conn.execute("COMMIT")
        print("Successfully recreated tables")
    except Error as e:
        _conn.execute("ROLLBACK")
        print(e)


    print("+++++++++++++++++++")


def populateTable(_conn):
    print("+++++++++++++++++++")
    print("Repopulating tables")

    try:
        Game = [
                (0, 1, 16, 20, "Super Smash Bros:WiiU", 65.90, 146, "Fighting", 2014),
                (1, 3, 1, 21, "The Elder Scrolls V: Skyrim", 36.99, 232, "RolePlaying", 2011),
                (1, 3, 2, 21, "The Elder Scrolls V: Skyrim", 36.99, 232, "RolePlaying", 2011),
                (1, 3, 7, 21, "The Elder Scrolls V: Skyrim", 36.99, 232, "RolePlaying", 2011),
                (1, 3, 17, 21, "The Elder Scrolls V: Skyrim", 36.99, 232, "RolePlaying", 2011),
                (2, 3, 1, 22, "Call of Duty: Black Ops II", 65.01, 28.5, "Shooter", 2012),
                (2, 3, 2, 22, "Call of Duty: Black Ops II", 65.01, 28.5, "Shooter", 2012),
                (2, 3, 7, 22, "Call of Duty: Black Ops II", 65.01, 28.5, "Shooter", 2012),
                (3, 2, 1, 9, "Half-Life", 28.99, 42.5, "Action", 1998),
                (4, 1, 17, 20, "The Legend of Zelda: Breath Of The Wild", 47.98, 189, "Exploration", 2017),
                (5, 1, 17, 20, "Super Mario Odyssey", 50.48, 12.5, "PlatFormer", 2017),
                (6, 3, 1, 9, "Counter-Strike: Global Offensive", 0.00, 999, "Shooter", 2012),
                (7, 1, 1, 9, "DOTA 2", 0.00, 999, "MOBA", 2013),
                (8, 3, 1, 8, "Red Dead Redemption II", 26.50, 174, "Adventure", 2018),
                (8, 3, 2, 8, "Red Dead Redemption II", 26.50, 174, "Adventure", 2018),
                (8, 3, 7, 8, "Red Dead Redemption II", 26.50, 174, "Adventure", 2018),
                (9, 3, 1, 8, "Grand Theft Auto V", 19.93, 79.5, "Action", 2013),
                (9, 3, 2, 8, "Grand Theft Auto V", 19.93, 79.5, "Action", 2013),
                (9, 3, 7, 8, "Grand Theft Auto V", 19.93, 79.5, "Action", 2013),
                (10, 2, 1, 23, "Fortnite", 0.00, 999, "Shooter", 2017),
                (10, 2, 2, 23, "Fortnite", 0.00, 999, "Shooter", 2017),
                (10, 2, 7, 23, "Fortnite", 0.00, 999, "Shooter", 2017),
                (10, 2, 17, 23, "Fortnite", 0.00, 999, "Shooter", 2017),
                (11, 0, 1, 24, "Minecraft", 32.17, 999, "Sandbox", 2011),
                (11, 0, 2, 24, "Minecraft", 32.17, 999, "Sandbox", 2011),
                (11, 0, 7, 24, "Minecraft", 32.17, 999, "Sandbox", 2011),
                (11, 0, 17, 24, "Minecraft", 32.17, 999, "Sandbox", 2011),
                (12, 0, 17, 3, "Pokemon Sword and Shield", 60, 25.5, "RolePlaying", 2019),
                (13, 3, 2, 9, "Persona 5", 19.99, 173, "RolePlaying", 2016),
                (13, 3, 1, 9, "Persona 5", 19.99, 173, "RolePlaying", 2016),
                (13, 3, 7, 9, "Persona 5", 19.99, 173, "RolePlaying", 2016),
                (13, 3, 17, 9, "Persona 5", 19.99, 173, "RolePlaying", 2016),
                (14, 0, 11, 20, "Super Mario Bros", 100, 3, "PlatFormer", 1985),
                (15, 2, 5, 2, "XenoSaga", 434.66, 60.5, "RolePlaying", 2005),
                (16, 2, 14, 20, "Fire Emblem: Path of Radiance", 365, 43.5, "RolePlaying", 2005),
                (17, 2, 5, 20, "Monster Hunter", 40, 50, "Adventure", 2004),
                (18, 3, 1, 11, "Dark Souls II", 39.99, 121, "RolePlaying", 2014),
                (18, 3, 2, 11, "Dark Souls II", 39.99, 121, "RolePlaying", 2014),
                (18, 3, 7, 11, "Dark Souls II", 39.99, 121, "RolePlaying", 2014),
                (19, 3, 1, 9, "Nier iii", 300, 100, "Action", 2024)
        ]
        sql = "INSERT INTO Game VALUES(?,?,?,?,?,?,?,?,?)"
        _conn.executemany(sql, Game)


        UserPurchases = [
                (0, "Joe", 10011, 21, "kjhgkjhdfg", "vivatmeb@outlookbox.me"),
                (4, "Bob", 10013, 30, "askjhdkgfjh", "tushiegirlie@redinggtonlaz.xyz"),
                (2, "Sam", 20345, 23, "mnwrhrth", "christopherbooth7@dmxs8.com"),
                (19, "Smith", 53948, 33, "mbjieergh", "prostock@dmxs8.com"),
                (14, "Smith", 53948, 33, "mbjieergh", "prostock@dmxs8.com"),
                (12, "Smith", 53948, 33, "mbjieergh", "prostock@dmxs8.com"),
                (11, "Smith", 53948, 33, "mbjieergh", "prostock@dmxs8.com"),
                (9, "Teric", 30594, 45, "iuqojsdnfg", "tonjr@mailpluss.com"),
                (7, "Jose", 90405, 14, "msnbkjng", "rmarvin@mayboy.xyz"),
                (3, "Daniel", 58395, 46, "mgnbs", "vvolkovvl@lvufaa.xyz"),
                (0, "Obama", 93005, 90, ",mnbnljewghiuw", "sazikk@packiu.com"),
                (1, "Obama", 93005, 90, ",mnbnljewghiuw", "sazikk@packiu.com"),
                (15, "Obama", 93005, 90, ",mnbnljewghiuw", "sazikk@packiu.com"),
                (16, "Obama", 93005, 90, ",mnbnljewghiuw", "sazikk@packiu.com"),
                (4, "Obama", 93005, 90, ",mnbnljewghiuw", "sazikk@packiu.com"),
                (3, "Tom", 123534, 21, "kjdnsfkjlrhg", "4345207@ffo.kr"),
                (4, "Tim", 57484, 21, "segnsekgj", "razo77@bomukic.com"),
                (6, "Maddie", 12222, 44, "m,sdgheughl", "glebshaab@bukanimers.com"),
                (16, "Maddie", 12222, 44, "m,sdgheughl", "glebshaab@bukanimers.com"),
                (13, "Maddie", 12222, 44, "m,sdgheughl", "glebshaab@bukanimers.com"),
                (13, "Sophie", 43535, 26, "ekjrghlker", "himmrs5365@gbnbancorp.com"),
                (15, "Sophie", 43535, 26, "ekjrghlker", "himmrs5365@gbnbancorp.com"),
                (14, "Sophie", 43535, 26, "ekjrghlker", "himmrs5365@gbnbancorp.com"),
                (13, "Mihn", 75748, 27, "kjwerghkejrg", "collinstur6616@hotmail.red"),
                (0, "Eren", 48848, 28, "kdsnbsd.mb", "emzari@storebas.fun"),
                (18, "Jesus", 98686, 80, "iouetpoiu", "svetikrozhko@pianoxltd.com"),
                (16, "Maria", 94969, 45, "kdjfhgklesrig", "toreto1907@stamberg.nl"),
                (18, "Mayra", 24, 28, "kigjoerig", "vgmanzari@sambeltrasi.site"),
                (3, "Mary", 5868, 55, "vnijghwihg", "tupps@emvil.com"),
                (17, "Mary", 5868, 55, "vnijghwihg", "tupps@emvil.com"),
                (13, "Mary", 5868, 55, "vnijghwihg", "tupps@emvil.com"),
                (10, "Mary", 5868, 55, "vnijghwihg", "tupps@emvil.com"),
                (7, "Imane", 38586, 43, "kwerghwrgi", "tanya1222222@mayboy.xyz"),
                (5, "Imane", 38586, 43, "kwerghwrgi", "tanya1222222@mayboy.xyz"),
                (16, "Lyn", 1, 18, "kjwergewrg", "jaeshen1@storebas.fun"),
                (18, "Lyn", 1, 18, "kjwergewrg", "jaeshen1@storebas.fun")
        ]
        sql = "INSERT INTO UserPurchases VALUES(?,?,?,?,?,?)"
        _conn.executemany(sql, UserPurchases)


        Rating = [
                (0, "E", "3+", "G"),
                (1, "E10+", "12+", "PG 12+"),
                (2, "T", "16+", "PG 15+"),
                (3, "M", "18+", "R 18+")
        ]
        sql = "INSERT INTO Rating VALUES(?,?,?,?)"
        _conn.executemany(sql, Rating)


        Platform = [
                (1, "PC", "Windows", "PC"),
                (2, "PS5", "PS5 OS", "PlayStation"),
                (3, "PS4", "PS4 OS", "PlayStation"),
                (4, "PS3", "PS3 OS", "PlayStation"),
                (5, "PS2", "PS2 OS", "PlayStation"),
                (6, "PS1", "PS1 OS", "PlayStation"),
                (7, "Xbox Series S/X", "Xbox one software", "Xbox"),
                (8, "Xbox One/One S/One X ", "Xbox one software", "Xbox"),
                (9, "Xbox 360", "Xbox 360 Software", "Xbox"),
                (10, "Xbox", "First generation software", "Xbox"),
                (11, "Nintendo Entertainment System", "On Chip System", "Nintendo"),
                (12, "Super Nintendo Entertainment System", "On Chip System", "Nintendo"),
                (13, "Nintendo 64", "small OS", "Nintendo"),
                (14, "Nintendo GameCube", "GameCube Os", "Nintendo"),
                (15, "Wii", "Wii System software", "Nintendo"),
                (16, "Wii U", "Wii U system Software", "Nintendo"),
                (17, "Nintendo Switch", "Horizon ", "Nintendo"),
                (18, "SG-1000/3000", "SG software", "Sega"),
                (19, "Sega Master System", "SegaMaster Software", "Sega"),
                (20, "Sega Genesis", "MegaDrive", "Sega"),
                (21, "Sega Saturn", "CD Operating System", "Sega"),
                (22, "Sega DreamCast", "DreamCast OS ", "Sega")
        ]
        sql = "INSERT INTO Platform VALUES(?,?,?,?)"
        _conn.executemany(sql, Platform)


        Publisher = [
                (0, "2k Games", "Andrew Walker", 2005, None, "UnitedStates"),
                (1, "3D Realms", "Fedrerick Schreiber", 1987, None, "UnitedStates"),
                (2, "Activision", "BobbyKotick", 1979, None, "UnitedStates"),
                (3, "Microsoft", "Satya Nadella", 1975, None, "UnitedStates"),
                (4, "Sony", "Kenichiro Yoshida", 1948, None, "Japan"),
                (5, "Humble Games", "Jeffrey Rosen", 2010, None, "UnitedStates"),
                (6, "Bethesda", "Todd Howard", 2001, None, "UnitedStates"),
                (7, "Capcom", "Kenzo Tsujimoto", 1979, None, "Japan"),
                (8, "Bandai Namco", "Naoki Katashima", 2006, None, "Japan"),
                (9, "Sega", "Haruki Satomi", 1951, None, "Japan"),
                (10, "Electronic Arts", "Andrew Wilson", 2006, None, "UnitedStates"),
                (11, "505 Games", "Linny Cendana", 1948, None, "Italy"),
                (12, "Devolver Digital", "Douglas Morin", 2009, None, "UnitedStates"),
                (13, "Square Enix", "Yosuke Matsuda", 2003, None, "Japan"),
                (14, "DANGEN Entertainment", "Judd", 2017, None, "Japan"),
                (15, "Nintendo", "Kenichiro Yoshida", 1889, None, "Japan"),
                (16, "Atari Games", "Wade Rosen", 1984, 2003, "UnitedStates"),
                (17, "Blue Omega", None, 2003, 2009, "UnitedStates"),
                (18, "Gamelab", "Maxim Zasov", 2000, 2009, "UnitedStates"),
                (19, "Ion Storm", "John Romero", 1996, 2005, "UnitedStates"),
                (20, "Independent", None, None, None, None )
        ]
        sql = "INSERT INTO Publisher VALUES(?,?,?,?,?,?)"
        _conn.executemany(sql, Publisher)


        Developer = [
                (0, 10, "BioWare", "Ray Muzyka", 1995, None, "Canada"),
                (1, 15, "1-UP studio", "Gen Kadoi", 2000, None, "Japan"),
                (2, 15, "Monoith Soft", "Tetsuya Takahashi", 1999, None, "Japan"),
                (3, 15, "Pokimon company", "Tsunekazu Ishihara", 1998, None, "Japan"),
                (4, 10, "Origion Systems", "Richard Garriott", 1983, None, "UnitedStates"),
                (5, 10, "Bullfrog Productions", "Peter Molyneux", 1987, 2001, "UnitedKingdom"),
                (6, 10, "PlayNation", "Jeff Robertson", 1997, None, "UnitedStates"),
                (7, 10, "DreamworksInteractive", "Christopher Defaria", 1995, 2013, "UnitedStates"),
                (8, 20, "Rockstar Games", "Strauss Zelnick", 1998, None, "UnitedStates"),
                (9, 20, "Valve", "Gabe Newell", 1996, None, "UnitedStates"),
                (10, 9, "Atlus", "Shinichi Suzuki", 1986, None, "Japan "),
                (11, 20, "FromSoftware", "Hidetaka Miyazaki", 1986, None, "Japan"),
                (12, 4, "Guerilla Games", "Hermen Hulst", 2000, None, "Netherlands"),
                (13, 9, "Platinum Games", "Ray Muzyka", "Kenichi Sato", None, "Japan"),
                (14, 9, "Ryu Ga Gotoku Studio", "Toshihiro Nagoshi", 2011, None, "Japan"),
                (15, 3, "Obsidian Entertainment", "Feargus Urquhart", 2003, None, "UnitedStates"),
                (16, 9, "Creative Assembly", "Tim Ansell", 1987, None, "UnitedKingdom"),
                (17, 10, "Respawn Entertainment", "Vince Zampella", 2010, None, "UnitedStates"),
                (18, 20, "Capcom", "Kenzo Tsujimoto", 1979, None, "Japan"),
                (19, 20, "Square Enix", "Yosuke Matsuda", 2003, None, "Japan"),
                (20, 20, "Nintendo", "Kenichiro Yoshida", 1889, None, "Japan"),
                (21, 20, "Bethesda", "Todd Howard", 2001, None, "UnitedStates"),
                (22, 20, "Activision", "BobbyKotick", 1979, None, "UnitedStates"),
                (23, 20, "EPIC", "Tim Sweeney", 1991, None, "UnitedStates"),
                (24, 20, "Microsoft", "Satya Nadella", 1975, None, "UnitedStates")
        ]
        sql = "INSERT INTO Developer VALUES(?,?,?,?,?,?,?)"
        _conn.executemany(sql, Developer)


        _conn.commit()
        print("success repopulated tables")
    except Error as e:
        _conn.rollback()
        print(e)


        print("Successlly populated tables")

    print("+++++++++++++++++++")


def reset(conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Reseting tables")

    dropTable(conn)
    createTable(conn)
    populateTable(conn)

    print("Tables Reset")
    print("++++++++++++++++++++++++++++++++++")

def query1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Query 1:")
    print("")
    print("--Displaying every game once and their general information--")

    try:
        sql = """SELECT 
                    g_id, 
                    g_name, 
                    g_price, 
                    g_length, 
                    g_genre, 
                    g_releasedate
                FROM Game
                GROUP BY g_id, g_name
                ORDER BY g_id ASC"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        l = '{:>0} {:>10} {:>10} {:>10} {:>10} {:>10}'.format("game_id", "game_name", "game_price", "game_length", "game_genre", "game_release_date")
        print(l)
        print("----------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l = '{:>0} {:>10} {:>10} {:>10} {:>10} {:>10}'.format(row[0], row[1], row[2], row[3], row[4], row[5])
            print(l)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Query 2:")
    print("--Displaying the average age of all users--")

    try:
        sql = """SELECT 
                    AVG(Age)
                FROM 
                    (SELECT 
                        DISTINCT u_id, 
                        u_age AS Age
                    FROM 
                        UserPurchases)"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        l = '{:>0}'.format("avergae_age")
        print(l)
        print("----------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l = '{:>0}'.format(row[0])
            print(l)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query3(_conn, _year):
    print("++++++++++++++++++++++++++++++++++")
    print("Query 3:")
    print("--Displays all games created after the year 2000 (parameter)--")

    try:
        sql = f"""SELECT 
                    Distinct g_name, 
                    g_releasedate 
                FROM 
                    Game 
                WHERE 
                    g_releasedate > {_year}"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        l = '{:>0} {:>10}'.format("name", "year")
        print(l)
        print("----------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l = '{:>0} {:>10}'.format(row[0], row[1])
            print(l)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query4(_conn, _publisher):
    print("++++++++++++++++++++++++++++++++++")
    print("Query 4:")
    print("--Display how many developers that are owned by EA (parameter)--")

    try:
        sql = f"""SELECT 
                    COUNT(d_name) 
                FROM
                    Publisher P,
                    Developer D
                WHERE 
                    D.pub_id = P.pub_id
                    AND p_name = '{_publisher}'"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        l = '{:>0}'.format("EA_Devs")
        print(l)
        print("----------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l = '{:>0}'.format(row[0])
            print(l)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Query 5:")
    print("--Display all developers shutdown under EA, their establishment, disestablishment year, and how many years they were in operation--")

    try:
        sql = """SELECT 
                    d_name, 
                    d_est, 
                    d_dest, 
                    (d_dest - d_est)
                FROM 
                    Publisher P,
                    Developer D
                WHERE 
                    D.pub_id = P.pub_id
                    AND p_name = 'Electronic Arts'
                    AND d_dest IS NOT NULL"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        l = '{:>0} {:>10} {:>10} {:>10}'.format("developer", "est_date", "disest_date", "operation_length")
        print(l)
        print("----------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l = '{:>0} {:>10} {:>10} {:>10}'.format(row[0], row[1], row[2], row[3])
            print(l)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query6(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Query 6:")
    print("--Display the users with the weakest(shortest) and strongest(longest) password--")

    try:
        sql = """SELECT 
                    User1, 
                    Pass1, 
                    User2, 
                    Pass2
                FROM
                    (SELECT 
                        u_name AS User1, 
                        u_password AS Pass1, 
                        MIN(LENGTH(u_password)) 
                    FROM 
                        UserPurchases),
                    (SELECT 
                        u_name AS User2, 
                        u_password AS Pass2, 
                        MAX(LENGTH(u_password)) 
                    FROM 
                        UserPurchases)"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        l = '{:>0} {:>10} {:>10} {:>10}'.format("user_1", "weak_password", "user_2", "strong_password")
        print(l)
        print("----------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l = '{:>0} {:>10} {:>10} {:>10}'.format(row[0], row[1], row[2], row[3])
            print(l)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query7(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Query 7:")
    print("--Display all games, their rating in the US, the users that own them, and thier age--")

    try:
        sql = """SELECT 
                    g_name, 
                    r_NA,
                    u_name, 
                    u_age
                FROM 
                    UserPurchases U, 
                    Game G,  
                    Rating R
                WHERE 
                    U.g_id = G.g_id
                    AND G.r_id = R.r_id
                GROUP BY 
                    g_name"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        l = '{:>0} {:>10} {:>10} {:>10}'.format("game", "rating", "user", "age")
        print(l)
        print("----------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l = '{:>0} {:>10} {:>10} {:>10}'.format(row[0], row[1], row[2], row[3])
            print(l)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query8(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Query 8:")
    print("--Display how many users own the oldest game, and their average age--")

    try:
        sql = """SELECT 
                    G1, 
                    COUNT(N),
                    AVG(A)
                FROM
                    (SELECT
                        g_name AS G1, 
                        u_name AS N, 
                        u_age AS A
                    FROM 
                        Game G, 
                        UserPurchases U
                    WHERE 
                        U.g_id = G.g_id), 
                    (SELECT g_name AS G2, MIN(g_releasedate) 
                    FROM Game)
                WHERE G1 = G2"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        l = '{:>0} {:>10} {:>10}'.format("game", "total_owned", "avg_age")
        print(l)
        print("----------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l = '{:>0} {:>10} {:>10}'.format(row[0], row[1], row[2])
            print(l)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query9(_conn, _limit, _owner):
    print("++++++++++++++++++++++++++++++++++")
    print("Query 9:")
    print("--Display 3 developers that are independent and 1 of their games (parameter)--")

    try:
        sql = f"""SELECT 
                    d_name, 
                    g_name,
                    p_name
                FROM
                    Game G, 
                    Developer D, 
                    Publisher P
                WHERE 
                    P.pub_id = D.pub_id 
                    AND D.d_id = G.d_id
                    AND p_name = '{_owner}'
                LIMIT {_limit}"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        l = '{:>0} {:>10} {:>10}'.format("developer", "game", "Ownership_stat")
        print(l)
        print("----------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l = '{:>0} {:>10} {:>10}'.format(row[0], row[1],  row[2])
            print(l)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query10(_conn, _platform):
    print("++++++++++++++++++++++++++++++++++")
    print("Query 10:")
    print("--Display the games that are nintendo exclusive and the OS it was developed on (parameter)--")

    try:
        sql = f"""SELECT 
                    g_name, 
                    p_os
                FROM 
                    Game G, 
                    Platform P
                WHERE 
                    G.pl_id = P.pl_id
                    AND p_type = '{_platform}'"""
                
        cur = _conn.cursor()
        cur.execute(sql)

        l = '{:>0}'.format("game")
        print(l)
        print("----------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l = '{:>0}'.format(row[0])
            print(l)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query11(_conn):
    print("Query 11:")
    print("--A new user has created an account and bought GTA 5 for the PS5--")
    print("--Insert the users information--")

    try:
        UserPurchases = [
            (9, "Abraham", 37266, 18, "2*&n4t*hjf", "bruh@gmail.com")
        ]
        sql = "INSERT INTO UserPurchases VALUES(?,?,?,?,?,?)"
        _conn.executemany(sql, UserPurchases)

        _conn.commit()
    except Error as e:
        _conn.rollback()
        print(e)


    print("++++++++++++++++++++++++++++++++++")


def query12(_conn):
    print("Query 12:")
    print("--A new console with a custom OS has been created--")
    print("--Insert the Platforms information--")

    try:
        Platform = [
            (23, "Gunko Ultra", "Gunko OS", "Gunko")
        ]
        sql = "INSERT INTO Platform VALUES(?,?,?,?)"
        _conn.executemany(sql, Platform)

        _conn.commit()
    except Error as e:
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query13(_conn, _id, _rat, _plat, _dev, _name, _price, _len, _genre, _year):
    print("Query 13:")
    print("--A new exlusive Teen rated game for the Gunko has been released today by BioWare--")
    print("--Insert the games information (parameter)--")

    try:
        Game = [
             (_id, _rat, _plat, _dev, _name, _price, _len, _genre, _year)
        ]
        sql = "INSERT INTO Game VALUES(?,?,?,?,?,?,?,?,?)"
        _conn.executemany(sql, Game)

        _conn.commit()
    except Error as e:
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query14(_conn):
    print("Query 14:")
    print("--Sony has created three new mobile game development studios--")
    print("--Insert the the three new developers information--")

    try:
        Developer = [
            (25, 4, "SonyMobileUS", "John Johnson", 2022, None, "UnitedStates"), 
            (26, 4, "SonyMobileJP", "Johnny Johnson", 2022, None, "Japan"),
            (27, 4, "SonyMobileCA", "Jimmy Johnson", 2022, None, "Canada")
        ]
        sql = "INSERT INTO Developer VALUES(?,?,?,?,?,?,?)"
        _conn.executemany(sql, Developer)

        _conn.commit()
    except Error as e:
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query15(_conn):
    print("Query 15:")
    print("--EA has shutdown another publisher--")
    print("--Update BioWare's Disestablished year--")

    try:
        sql = """UPDATE 
                    Developer
                SET 
                    d_dest = 2022
                WHERE 
                    d_name = 'BioWare'"""
                
        cur = _conn.cursor()
        cur.execute(sql)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query16(_conn):
    print("Query 16:")
    print("--Nier iii has been pushed back two years--")
    print("--Update Nier iii's release date--")

    try:
        sql = """UPDATE 
                    Game
                SET 
                    g_releasedate = 2026
                WHERE 
                    g_name = 'Nier iii'"""
                
        cur = _conn.cursor()
        cur.execute(sql)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query17(_conn, _user):
    print("Query 17:")
    print("--The user Obama has changed their email and password for security concerns--")
    print("--Update the password of the user (parameter)--")

    try:
        sql = f"""UPDATE 
                    UserPurchases
                SET 
                    u_password = 'OBAMA_BOSS_Fight12345',
                    u_email = 'OBAMAmail@Obamium.net'
                WHERE 
                    u_name = '{_user}'"""
                
        cur = _conn.cursor()
        cur.execute(sql)

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

def query18(_conn, _game, _price):
    print("Query 18:")
    print("--Minecraft is now free, but only for PC players--")
    print("--Update the price of the PC version of minecraft (parameter)--")

    try:
        sql = f"""UPDATE 
                    Game
                SET
                    g_price = {_price}
                WHERE 
                    pl_id IN (SELECT 
                                G.pl_id 
                            FROM
                                Game G,
                                Platform P
                            WHERE    
                                G.pl_id = P.pl_id
                                AND P.p_name = 'PC')
                    AND g_name = '{_game}'"""
                    
                
        cur = _conn.cursor()
        cur.execute(sql)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

def query19(_conn):
    print("Query 19:")
    print("--All the worlds rating systems have decided that teens are now classified as adults--")
    print("--Delete the adult rating system--")

    try:
        sql = """DELETE
                FROM
                    Rating
                WHERE
                    r_EU = '18+'"""
                
        cur = _conn.cursor()
        cur.execute(sql)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def query20(_conn, _user):
    print("Query 20:")
    print("--User Tim has been banned--")
    print("--Delete the users information--")

    try:
        sql = f"""DELETE 
                FROM
                    UserPurchases
                WHERE
                    u_name = '{_user}'"""
                
        cur = _conn.cursor()
        cur.execute(sql)
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"db.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        reset(conn)

        query1(conn)
        query2(conn)
        query3(conn, 2000)
        query4(conn, "Electronic Arts")
        query5(conn)
        query6(conn)
        query7(conn)
        query8(conn)
        query9(conn, 3, "Independent")
        query10(conn, "Nintendo")
        query11(conn)
        query12(conn)
        query13(conn, 20, 2, 23, 0, "Volair Scrapper", 69.99, 50, "Fighting", 2022)
        query14(conn)
        query15(conn)
        query16(conn)
        query17(conn, "Obama")
        query18(conn, "Minecraft", 0.00)
        query19(conn)
        query20(conn, "Tim")

    closeConnection(conn, database)


if __name__ == '__main__':
    main()