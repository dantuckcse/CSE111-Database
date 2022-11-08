DROP TABLE Game;
DROP TABLE UserPurchases;
DROP TABLE Rating;
DROP TABLE Platform;
DROP TABLE Publisher;
DROP TABLE Developer;


CREATE TABLE Game (
    g_id int(10) NOT NULL, 
    r_id int(10) NOT NULL, 
    pl_id int(10) NOT NULL, 
    d_id int(10) NOT NULL, 
    g_name varchar(50) NOT NULL, 
    g_price DECIMAL(4, 2) NOT NULL, 
    g_length DECIMAL(4, 2) NOT NULL, 
    g_genre varchar(50) NOT NULL, 
    g_releasedate int(50) NOT NULL
);


CREATE TABLE UserPurchases (
    g_id int(10) NOT NULL, 
    u_name varchar(50) NOT NULL, 
    u_id int(5) NOT NULL, 
    u_age int(2) NOT NULL, 
    u_password varchar(50) NOT NULL, 
    u_email varchar(50) NOT NULL
);


CREATE TABLE Rating (
    r_id int(10) PRIMARY KEY, 
    r_NA varchar(50) NOT NULL, 
    r_EU varchar(50) NOT NULL, 
    r_Asia varchar(50) NOT NULL
);


CREATE TABLE Platform (
    pl_id int(10) PRIMARY KEY, 
    p_name varchar(50) NOT NULL, 
    p_os varchar(50) NOT NULL
);


CREATE TABLE Publisher (
    pub_id int(10) PRIMARY KEY, 
    p_name varchar(50) NOT NULL, 
    p_ceo varchar(50), 
    p_est int(4), 
    p_dest int(4), 
    p_location varchar(50)
);


CREATE TABLE Developer (
    d_id int(10) PRIMARY KEY, 
    pub_id int(10) NOT NULL, 
    d_name varchar(50) NOT NULL, 
    d_ceo varchar(50) NOT NULL, 
    d_est int(4) NOT NULL, 
    d_dest int(4), 
    d_location varchar(50) NOT NULL
   
);


-- insert game data
INSERT INTO Game VALUES(0, 1, 16, 20, "Super Smash Bros:WiiU", 65.90, 146, "Fighting", 2014);
INSERT INTO Game VALUES(1, 3, 1, 21, "The Elder Scrolls V: Skyrim", 36.99, 232, "RolePlaying", 2011);
INSERT INTO Game VALUES(1, 3, 2, 21, "The Elder Scrolls V: Skyrim", 36.99, 232, "RolePlaying", 2011);
INSERT INTO Game VALUES(1, 3, 7, 21, "The Elder Scrolls V: Skyrim", 36.99, 232, "RolePlaying", 2011);
INSERT INTO Game VALUES(1, 3, 17, 21, "The Elder Scrolls V: Skyrim", 36.99, 232, "RolePlaying", 2011);
INSERT INTO Game VALUES(2, 3, 1, 22, "Call of Duty: Black Ops II", 65.01, 28.5, "Shooter", 2012);
INSERT INTO Game VALUES(2, 3, 2, 22, "Call of Duty: Black Ops II", 65.01, 28.5, "Shooter", 2012);
INSERT INTO Game VALUES(2, 3, 7, 22, "Call of Duty: Black Ops II", 65.01, 28.5, "Shooter", 2012);
INSERT INTO Game VALUES(3, 2, 1, 9, "Half-Life", 28.99, 42.5, "Action", 1998);
INSERT INTO Game VALUES(4, 1, 17, 20, "The Legend of Zelda: Breath Of The Wild", 47.98, 189, "Exploration", 2017);
INSERT INTO Game VALUES(5, 1, 17, 20, "Super Mario Odyssey", 50.48, 12.5, "PlatFormer", 2017);
INSERT INTO Game VALUES(6, 3, 1, 9, "Counter-Strike: Global Offensive", 0.00, 999, "Shooter", 2012);
INSERT INTO Game VALUES(7, 1, 1, 9, "DOTA 2", 0.00, 999, "MOBA", 2013);
INSERT INTO Game VALUES(8, 3, 1, 8, "Red Dead Redemption II", 26.50, 174, "Adventure", 2018);
INSERT INTO Game VALUES(8, 3, 2, 8, "Red Dead Redemption II", 26.50, 174, "Adventure", 2018);
INSERT INTO Game VALUES(8, 3, 7, 8, "Red Dead Redemption II", 26.50, 174, "Adventure", 2018);
INSERT INTO Game VALUES(9, 3, 1, 8, "Grand Theft Auto V", 19.93, 79.5, "Action", 2013);
INSERT INTO Game VALUES(9, 3, 2, 8, "Grand Theft Auto V", 19.93, 79.5, "Action", 2013);
INSERT INTO Game VALUES(9, 3, 7, 8, "Grand Theft Auto V", 19.93, 79.5, "Action", 2013);
INSERT INTO Game VALUES(10, 2, 1, 23, "Fortnite", 0.00, 999, "Shooter", 2017);
INSERT INTO Game VALUES(10, 2, 2, 23, "Fortnite", 0.00, 999, "Shooter", 2017);
INSERT INTO Game VALUES(10, 2, 7, 23, "Fortnite", 0.00, 999, "Shooter", 2017);
INSERT INTO Game VALUES(10, 2, 17, 23, "Fortnite", 0.00, 999, "Shooter", 2017);
INSERT INTO Game VALUES(11, 0, 1, 24, "Minecraft", 32.17, 999, "Sandbox", 2011);
INSERT INTO Game VALUES(11, 0, 2, 24, "Minecraft", 32.17, 999, "Sandbox", 2011);
INSERT INTO Game VALUES(11, 0, 7, 24, "Minecraft", 32.17, 999, "Sandbox", 2011);
INSERT INTO Game VALUES(11, 0, 17, 24, "Minecraft", 32.17, 999, "Sandbox", 2011);
INSERT INTO Game VALUES(12, 0, 17, 3, "Pokemon Sword and Shield", 60, 25.5, "RolePlaying", 2019);
INSERT INTO Game VALUES(13, 3, 2, 9, "Persona 5", 19.99, 173, "RolePlaying", 2016);
INSERT INTO Game VALUES(13, 3, 1, 9, "Persona 5", 19.99, 173, "RolePlaying", 2016);
INSERT INTO Game VALUES(13, 3, 7, 9, "Persona 5", 19.99, 173, "RolePlaying", 2016);
INSERT INTO Game VALUES(13, 3, 17, 9, "Persona 5", 19.99, 173, "RolePlaying", 2016);
INSERT INTO Game VALUES(14, 0, 11, 20, "Super Mario Bros", 100, 3, "PlatFormer", 1985);
INSERT INTO Game VALUES(15, 2, 5, 2, "XenoSaga", 434.66, 60.5, "RolePlaying", 2005);
INSERT INTO Game VALUES(16, 2, 14, 20, "Fire Emblem: Path of Radiance", 365, 43.5, "RolePlaying", 2005);
INSERT INTO Game VALUES(17, 2, 5, 20, "Monster Hunter", 40, 50, "Adventure", 2004);
INSERT INTO Game VALUES(18, 3, 1, 11, "Dark Souls II", 39.99, 121, "RolePlaying", 2014);
INSERT INTO Game VALUES(18, 3, 2, 11, "Dark Souls II", 39.99, 121, "RolePlaying", 2014);
INSERT INTO Game VALUES(18, 3, 7, 11, "Dark Souls II", 39.99, 121, "RolePlaying", 2014);
INSERT INTO Game VALUES(19, 3, 1, 9, "Nier iii", 300, 100, "Action", 2024);


-- Insert UserPurchases data
INSERT INTO UserPurchases VALUES(0, "Joe", 10011, 21, "kjhgkjhdfg", "vivatmeb@outlookbox.me");
INSERT INTO UserPurchases VALUES(4, "Bob", 10013, 30, "askjhdkgfjh", "tushiegirlie@redinggtonlaz.xyz");
INSERT INTO UserPurchases VALUES(2, "Sam", 20345, 23, "mnwrhrth", "christopherbooth7@dmxs8.com");
INSERT INTO UserPurchases VALUES(19, "Smith", 53948, 33, "mbjieergh", "prostock@dmxs8.com");
INSERT INTO UserPurchases VALUES(14, "Smith", 53948, 33, "mbjieergh", "prostock@dmxs8.com");
INSERT INTO UserPurchases VALUES(12, "Smith", 53948, 33, "mbjieergh", "prostock@dmxs8.com");
INSERT INTO UserPurchases VALUES(11, "Smith", 53948, 33, "mbjieergh", "prostock@dmxs8.com");
INSERT INTO UserPurchases VALUES(9, "Teric", 30594, 45, "iuqojsdnfg", "tonjr@mailpluss.com");
INSERT INTO UserPurchases VALUES(7, "Jose", 90405, 14, "msnbkjng", "rmarvin@mayboy.xyz");
INSERT INTO UserPurchases VALUES(3, "Daniel", 58395, 46, "mgnbs", "vvolkovvl@lvufaa.xyz");
INSERT INTO UserPurchases VALUES(0, "Obama", 93005, 90, ", mnbnljewghiuw", "sazikk@packiu.com");
INSERT INTO UserPurchases VALUES(1, "Obama", 93005, 90, ", mnbnljewghiuw", "sazikk@packiu.com");
INSERT INTO UserPurchases VALUES(15, "Obama", 93005, 90, ", mnbnljewghiuw", "sazikk@packiu.com");
INSERT INTO UserPurchases VALUES(16, "Obama", 93005, 90, ", mnbnljewghiuw", "sazikk@packiu.com");
INSERT INTO UserPurchases VALUES(4, "Obama", 93005, 90, ", mnbnljewghiuw", "sazikk@packiu.com");
INSERT INTO UserPurchases VALUES(3, "Tom", 123534, 21, "kjdnsfkjlrhg", "4345207@ffo.kr");
INSERT INTO UserPurchases VALUES(4, "Tim", 57484, 21, "segnsekgj", "razo77@bomukic.com");
INSERT INTO UserPurchases VALUES(6, "Maddie", 12222, 44, "m, sdgheughl", "glebshaab@bukanimers.com");
INSERT INTO UserPurchases VALUES(16, "Maddie", 12222, 44, "m, sdgheughl", "glebshaab@bukanimers.com");
INSERT INTO UserPurchases VALUES(13, "Maddie", 12222, 44, "m, sdgheughl", "glebshaab@bukanimers.com");
INSERT INTO UserPurchases VALUES(13, "Sophie", 43535, 26, "ekjrghlker", "himmrs5365@gbnbancorp.com");
INSERT INTO UserPurchases VALUES(15, "Sophie", 43535, 26, "ekjrghlker", "himmrs5365@gbnbancorp.com");
INSERT INTO UserPurchases VALUES(14, "Sophie", 43535, 26, "ekjrghlker", "himmrs5365@gbnbancorp.com");
INSERT INTO UserPurchases VALUES(13, "Mihn", 75748, 27, "kjwerghkejrg", "collinstur6616@hotmail.red");
INSERT INTO UserPurchases VALUES(0, "Eren", 48848, 28, "kdsnbsd.mb", "emzari@storebas.fun");
INSERT INTO UserPurchases VALUES(18, "Jesus", 98686, 80, "iouetpoiu", "svetikrozhko@pianoxltd.com");
INSERT INTO UserPurchases VALUES(16, "Maria", 94969, 45, "kdjfhgklesrig", "toreto1907@stamberg.nl");
INSERT INTO UserPurchases VALUES(18, "Mayra", 24, 28, "kigj;oerig", "vgmanzari@sambeltrasi.site");
INSERT INTO UserPurchases VALUES(3, "Mary", 5868, 55, "vnijghwihg", "tupps@emvil.com");
INSERT INTO UserPurchases VALUES(17, "Mary", 5868, 55, "vnijghwihg", "tupps@emvil.com");
INSERT INTO UserPurchases VALUES(13, "Mary", 5868, 55, "vnijghwihg", "tupps@emvil.com");
INSERT INTO UserPurchases VALUES(10, "Mary", 5868, 55, "vnijghwihg", "tupps@emvil.com");
INSERT INTO UserPurchases VALUES(7, "Imane", 38586, 43, "kwerghwrgi", "tanya1222222@mayboy.xyz");
INSERT INTO UserPurchases VALUES(5, "Imane", 38586, 43, "kwerghwrgi", "tanya1222222@mayboy.xyz");
INSERT INTO UserPurchases VALUES(16, "Lyn", 1, 18, "kjwergewrg", "jaeshen1@storebas.fun");
INSERT INTO UserPurchases VALUES(18, "Lyn", 1, 18, "kjwergewrg", "jaeshen1@storebas.fun");


--Insert Rating Data
INSERT INTO Rating VALUES(0, "E", "3+", "G");
INSERT INTO Rating VALUES(1, "E10+", "12+", "PG 12+");
INSERT INTO Rating VALUES(2, "T", "16+", "PG 15+");
INSERT INTO Rating VALUES(3, "M", "18+", "R 18+");


--insert platform data
INSERT INTO Platform VALUES(1, "PC", "Windows", "PC"),
INSERT INTO Platform VALUES(2, "PS5", "PS5 OS", "PlayStation");
INSERT INTO Platform VALUES(3, "PS4", "PS4 OS", "PlayStation");
INSERT INTO Platform VALUES(4, "PS3", "PS3 OS", "PlayStation");
INSERT INTO Platform VALUES(5, "PS2", "PS2 OS", "PlayStation");
INSERT INTO Platform VALUES(6, "PS1", "PS1 OS", "PlayStation");
INSERT INTO Platform VALUES(7, "Xbox Series S/X", "Xbox one software", "Xbox");
INSERT INTO Platform VALUES(8, "Xbox One/One S/One X ", "Xbox one software", "Xbox");
INSERT INTO Platform VALUES(9, "Xbox 360", "Xbox 360 Software", "Xbox");
INSERT INTO Platform VALUES(10, "Xbox", "First generation software", "Xbox");
INSERT INTO Platform VALUES(11, "Nintendo Entertainment System", "On Chip System", "Nintendo");
INSERT INTO Platform VALUES(12, "Super Nintendo Entertainment System", "On Chip System", "Nintendo");
INSERT INTO Platform VALUES(13, "Nintendo 64", "small OS", "Nintendo");
INSERT INTO Platform VALUES(14, "Nintendo GameCube", "GameCube Os", "Nintendo");
INSERT INTO Platform VALUES(15, "Wii", "Wii System software", "Nintendo");
INSERT INTO Platform VALUES(16, "Wii U", "Wii U system Software", "Nintendo");
INSERT INTO Platform VALUES(17, "Nintendo Switch", "Horizon ", "Nintendo");
INSERT INTO Platform VALUES(18, "SG-1000/3000", "SG software", "Sega");
INSERT INTO Platform VALUES(19, "Sega Master System", "SegaMaster Software", "Sega");
INSERT INTO Platform VALUES(20, "Sega Genesis", "MegaDrive", "Sega");
INSERT INTO Platform VALUES(21, "Sega Saturn", "CD Operating System", "Sega");
INSERT INTO Platform VALUES(22, "Sega DreamCast", "DreamCast OS ", "Sega");


--insert Publisher data
INSERT INTO Publisher VALUES(0, "2k Games", "Andrew Walker", 2005, NULL, "UnitedStates");
INSERT INTO Publisher VALUES(1, "3D Realms", "Fedrerick Schreiber", 1987, NULL, "UnitedStates");
INSERT INTO Publisher VALUES(2, "Activision", "BobbyKotick", 1979, NULL, "UnitedStates");
INSERT INTO Publisher VALUES(3, "Microsoft", "Satya Nadella", 1975, NULL, "UnitedStates");
INSERT INTO Publisher VALUES(4, "Sony", "Kenichiro Yoshida", 1948, NULL, "Japan");
INSERT INTO Publisher VALUES(5, "Humble Games", "Jeffrey Rosen", 2010, NULL, "UnitedStates");
INSERT INTO Publisher VALUES(6, "Bethesda", "Todd Howard", 2001, NULL, "UnitedStates");
INSERT INTO Publisher VALUES(7, "Capcom", "Kenzo Tsujimoto", 1979, NULL, "Japan");
INSERT INTO Publisher VALUES(8, "Bandai Namco", "Naoki Katashima", 2006, NULL, "Japan");
INSERT INTO Publisher VALUES(9, "Sega", "Haruki Satomi", 1951, NULL, "Japan");
INSERT INTO Publisher VALUES(10, "Electronic Arts", "Andrew Wilson", 2006, NULL, "UnitedStates");
INSERT INTO Publisher VALUES(11, "505 Games", "Linny Cendana", 1948, NULL, "Italy");
INSERT INTO Publisher VALUES(12, "Devolver Digital", "Douglas Morin", 2009, NULL, "UnitedStates");
INSERT INTO Publisher VALUES(13, "Square Enix", "Yosuke Matsuda", 2003, NULL, "Japan");
INSERT INTO Publisher VALUES(14, "DANGEN Entertainment", "Judd", 2017, NULL, "Japan");
INSERT INTO Publisher VALUES(15, "Nintendo", "Kenichiro Yoshida", 1889, NULL, "Japan");
INSERT INTO Publisher VALUES(16, "Atari Games", "Wade Rosen", 1984, 2003, "UnitedStates");
INSERT INTO Publisher VALUES(17, "Blue Omega", NULL, 2003, 2009, "UnitedStates");
INSERT INTO Publisher VALUES(18, "Gamelab", "Maxim Zasov", 2000, 2009, "UnitedStates");
INSERT INTO Publisher VALUES(19, "Ion Storm", "John Romero", 1996, 2005, "UnitedStates");
INSERT INTO Publisher VALUES(20, "Independent", NULL, NULL, NULL, NULL );


--insert developer data
INSERT INTO Developer VALUES(0, 10, "BioWare", "Ray Muzyka", 1995, NULL, "Canada");
INSERT INTO Developer VALUES(1, 15, "1-UP studio", "Gen Kadoi", 2000, NULL, "Japan");
INSERT INTO Developer VALUES(2, 15, "Monoith Soft", "Tetsuya Takahashi", 1999, NULL, "Japan");
INSERT INTO Developer VALUES(3, 15, "Pokimon company", "Tsunekazu Ishihara", 1998, NULL, "Japan");
INSERT INTO Developer VALUES(4, 10, "Origion Systems", "Richard Garriott", 1983, NULL, "UnitedStates");
INSERT INTO Developer VALUES(5, 10, "Bullfrog Productions", "Peter Molyneux", 1987, 2001, "UnitedKingdom");
INSERT INTO Developer VALUES(6, 10, "PlayNation", "Jeff Robertson", 1997, NULL, "UnitedStates");
INSERT INTO Developer VALUES(7, 10, "DreamworksInteractive", "Christopher Defaria", 1995, 2013, "UnitedStates");
INSERT INTO Developer VALUES(8, 20, "Rockstar Games", "Strauss Zelnick", 1998, NULL, "UnitedStates");
INSERT INTO Developer VALUES(9, 20, "Valve", "Gabe Newell", 1996, NULL, "UnitedStates");
INSERT INTO Developer VALUES(10, 9, "Atlus", "Shinichi Suzuki", 1986, NULL, "Japan ");
INSERT INTO Developer VALUES(11, 20, "FromSoftware", "Hidetaka Miyazaki", 1986, NULL, "Japan");
INSERT INTO Developer VALUES(12, 4, "Guerilla Games", "Hermen Hulst", 2000, NULL, "Netherlands");
INSERT INTO Developer VALUES(13, 9, "Platinum Games", "Ray Muzyka", "Kenichi Sato", NULL, "Japan");
INSERT INTO Developer VALUES(14, 9, "Ryu Ga Gotoku Studio", "Toshihiro Nagoshi", 2011, NULL, "Japan");
INSERT INTO Developer VALUES(15, 3, "Obsidian Entertainment", "Feargus Urquhart", 2003, NULL, "UnitedStates");
INSERT INTO Developer VALUES(16, 9, "Creative Assembly", "Tim Ansell", 1987, NULL, "UnitedKingdom");
INSERT INTO Developer VALUES(17, 10, "Respawn Entertainment", "Vince Zampella", 2010, NULL, "UnitedStates");
INSERT INTO Developer VALUES(18, 20, "Capcom", "Kenzo Tsujimoto", 1979, NULL, "Japan");
INSERT INTO Developer VALUES(19, 20, "Square Enix", "Yosuke Matsuda", 2003, NULL, "Japan");
INSERT INTO Developer VALUES(20, 20, "Nintendo", "Kenichiro Yoshida", 1889, NULL, "Japan");
INSERT INTO Developer VALUES(21, 20, "Bethesda", "Todd Howard", 2001, NULL, "UnitedStates");
INSERT INTO Developer VALUES(22, 20, "Activision", "BobbyKotick", 1979, NULL, "UnitedStates");
INSERT INTO Developer VALUES(23, 20, "EPIC", "Tim Sweeney", 1991, NULL, "UnitedStates");
INSERT INTO Developer VALUES(24, 20, "Microsoft", "Satya Nadella", 1975, NULL, "UnitedStates");