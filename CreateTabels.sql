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
    p_os varchar(50) NOT NULL,
    p_type varchar(50) NOT NULL
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
INSERT INTO Game VALUES(20, 0, 23, 3, "Pokemon Yellow", 219, 20, "RolePlaying", 1998);
INSERT INTO Game VALUES(21, 0, 23, 3, "Pokemon Gold", 50, 20, "RolePlaying", 1999);
INSERT INTO Game VALUES(22, 0, 23, 3, "Pokemon Silver", 50, 20, "RolePlaying", 1999);
INSERT INTO Game VALUES(23, 0, 23, 3, "Pokemon Ruby", 50, 35, "RolePlaying", 2002);
INSERT INTO Game VALUES(24, 0, 23, 3, "Pokemon Saphire", 50, 35, "RolePlaying", 2002);
INSERT INTO Game VALUES(25, 0, 24, 3, "Pokemon Diamond", 60, 40, "RolePlaying", 2006);
INSERT INTO Game VALUES(26, 0, 24, 3, "Pokemon Pearl", 60, 40, "RolePlaying", 2006);
INSERT INTO Game VALUES(27, 0, 24, 3, "Pokemon Black", 60, 40, "RolePlaying", 2010);
INSERT INTO Game VALUES(28, 0, 24, 3, "Pokemon White", 60, 40, "RolePlaying", 2010);
INSERT INTO Game VALUES(29, 0, 24, 3, "Pokemon Black2", 60, 40, "RolePlaying", 2012);
INSERT INTO Game VALUES(30, 0, 24, 3, "Pokemon White2", 60, 40, "RolePlaying", 2012);
INSERT INTO Game VALUES(31, 0, 25, 3, "Pokemon X", 60, 41, "RolePlaying", 2013);
INSERT INTO Game VALUES(32, 0, 25, 3, "Pokemon Y", 60, 41, "RolePlaying", 2013);
INSERT INTO Game VALUES(33, 0, 26, 3, "Pokemon Sun", 55, 38, "RolePlaying", 2016);
INSERT INTO Game VALUES(34, 0, 26, 3, "Pokemon Moon", 55, 38, "RolePlaying", 2016)
INSERT INTO Game VALUES(35, 0, 17, 3, "Pokemon Sword", 60, 44, "RolePlaying", 2019);
INSERT INTO Game VALUES(36, 0, 17, 3, "Pokemon Shield", 60, 44, "RolePlaying", 2019);
INSERT INTO Game VALUES(37, 0, 11, 19, "Final Fantasy", 189, 17, "RolePlaying", 1987);
INSERT INTO Game VALUES(38, 1, 11, 19, "Final Fantasy II", 29, 24, "RolePlaying", 1988);
INSERT INTO Game VALUES(39, 1, 11, 19, "Final Fantasy III", 83, 34, "RolePlaying", 1990);
INSERT INTO Game VALUES(40, 1, 12, 19, "Final Fantasy IV", 40, 39, "RolePlaying", 1991);
INSERT INTO Game VALUES(41, 1, 27, 19, "Final Fantasy V", 26, 37, "RolePlaying", 1992);
INSERT INTO Game VALUES(42, 2, 12, 19, "Final Fantasy VI", 40, 41, "RolePlaying", 1994);
INSERT INTO Game VALUES(43, 2, 6, 19, "Final Fantasy VII", 20, 50, "RolePlaying", 1997);
INSERT INTO Game VALUES(44, 2, 6, 19, "Final Fantasy VIII", 10, 54, "RolePlaying", 1999);
INSERT INTO Game VALUES(45, 2, 6, 19, "Final Fantasy IX", 20, 53, "RolePlaying", 2000);
INSERT INTO Game VALUES(46, 2, 5, 19, "Final Fantasy X", 5, 70, "RolePlaying", 2001);
INSERT INTO Game VALUES(47, 2, 5, 19, "Final Fantasy XI:Online", 20, 999, "RolePlaying", 2002);
INSERT INTO Game VALUES(47, 2, 1, 19, "Final Fantasy XI:Online", 20, 999, "RolePlaying", 2002);
INSERT INTO Game VALUES(48, 2, 5, 19, "Final Fantasy XII", 5, 92, "RolePlaying", 2006);
INSERT INTO Game VALUES(49, 2, 4, 19, "Final Fantasy XIII", 20, 61, "RolePlaying", 2009);
INSERT INTO Game VALUES(49, 2, 9, 19, "Final Fantasy XIII", 20, 61, "RolePlaying", 2009);
INSERT INTO Game VALUES(50, 2, 1, 19, "Final Fantasy XIV:Online", 13, 999, "RolePlaying", 2010);
INSERT INTO Game VALUES(51, 2, 1, 19, "Final Fantasy XIV:A Realm Reborn", 13, 999, "RolePlaying", 2013);
INSERT INTO Game VALUES(51, 2, 2, 19, "Final Fantasy XIV:A Realm Reborn", 13, 999, "RolePlaying", 2013);
INSERT INTO Game VALUES(51, 2, 3, 19, "Final Fantasy XIV:A Realm Reborn", 13, 999, "RolePlaying", 2013);
INSERT INTO Game VALUES(51, 2, 4, 19, "Final Fantasy XIV:A Realm Reborn", 13, 999, "RolePlaying", 2013);
INSERT INTO Game VALUES(52, 2, 3, 19, "Final Fantasy XV", 20, 53, "RolePlaying", 2016);
INSERT INTO Game VALUES(52, 2, 8, 19, "Final Fantasy XV", 20, 53, "RolePlaying", 2016);
INSERT INTO Game VALUES(53, 3, 2, 19, "Final Fantasy XVI", 60, 80, "RolePlaying", 2023);
INSERT INTO Game VALUES(54, 2, 1, 21, "The Elder Scrolls:Arena", 200, 45, "RolePlaying", 1994);
INSERT INTO Game VALUES(55, 3, 4, 21, "The Elder Scrolls II: Daggerfall", 0.00, 88, "RolePlaying", 1996);
INSERT INTO Game VALUES(56, 3, 4, 21, "The Elder Scrolls III: Morrowind", 15, 107, "RolePlaying", 2002);
INSERT INTO Game VALUES(56, 3, 10, 21, "The Elder Scrolls III: Morrowind", 15, 107, "RolePlaying", 2002);
INSERT INTO Game VALUES(57, 3, 1, 21, "The Elder Scrolls IV: Oblivion", 15, 88, "RolePlaying", 2006);
INSERT INTO Game VALUES(57, 3, 4, 21, "The Elder Scrolls IV: Oblivion", 15, 88, "RolePlaying", 2006);
INSERT INTO Game VALUES(57, 3, 9, 21, "The Elder Scrolls IV: Oblivion", 15, 88, "RolePlaying", 2006);
INSERT INTO Game VALUES(58, 3, 6, 10, "Revelations: Persona", 375, 50, "RolePlaying", 1996);
INSERT INTO Game VALUES(59, 3, 6, 10, "Persona 2: Innocent Sin", 98, 48, "RolePlaying", 1999);
INSERT INTO Game VALUES(60, 3, 6, 10, "Persona 2: Eternal Punishment", 195, 70, "RolePlaying", 2000);
INSERT INTO Game VALUES(61, 3, 5, 10, "Persona 3", 850, 82, "RolePlaying", 2006);
INSERT INTO Game VALUES(62, 3, 5, 10, "Persona 4", 375, 80, "RolePlaying", 2008);
INSERT INTO Game VALUES(63, 0, 11, 20, "The Legend of Zelda", 2464.71, 8, "Adventure", 1987);
INSERT INTO Game VALUES(64, 0, 11, 20, "Zelda II: The Adventure of Link", 924, 8, "Adventure", 1988);
INSERT INTO Game VALUES(65, 1, 12, 20, "The Legend of Zelda:A Link To the Past", 1200, 17, "Adventure", 1991);
INSERT INTO Game VALUES(66, 1, 23, 20, "The Legend of Zelda: Link's Awakening", 35, 17, "Adventure", 1993);
INSERT INTO Game VALUES(67, 1, 13, 20, "The Legend of Zelda: Ocarina of Time", 903, 20, "Adventure", 1998);
INSERT INTO Game VALUES(68, 1, 13, 20, "The Legend of Zelda:Majora's Mask", 881, 30, "Adventure", 2000);
INSERT INTO Game VALUES(69, 1, 23, 20, "The Legend of Zelda:Oracle of Seasons", 664, 18, "Adventure", 2001);
INSERT INTO Game VALUES(70, 1, 23, 20, "The Legend of Zelda:Oracle of Ages", 600, 19, "Adventure", 2001);
INSERT INTO Game VALUES(71, 1, 23, 20, "The Legend of Zelda:A Link to the Past and Four Swords", 600, 18, "Adventure", 2002);
INSERT INTO Game VALUES(72, 1, 14, 20, "The Legend of Zelda:The Wind Waker", 190, 34, "Adventure", 2002);
INSERT INTO Game VALUES(73, 1, 14, 20, "The Legend of Zelda:Four Swords Adventure", 216, 6, "Adventure", 2004);
INSERT INTO Game VALUES(74, 1, 23, 20, "The Legend of Zelda:The Minish Cap", 485, 19, "Adventure", 2004);
INSERT INTO Game VALUES(75, 1, 14, 20, "The Legend of Zelda:Twilight Princess", 318, 14, "Adventure", 2006);
INSERT INTO Game VALUES(76, 1, 24, 20, "The Legend of Zelda:Phantom Hourglass", 79, 15, "Adventure", 2007);
INSERT INTO Game VALUES(77, 1, 14, 20, "The Legend of Zelda: Spirit Tracks", 60, 26, "Adventure", 2009);
INSERT INTO Game VALUES(78, 1, 15, 20, "The Legend of Zelda: Skyward Sword", 25, 46, "Adventure", 2011);
INSERT INTO Game VALUES(79, 1, 25, 20, "The Legend of Zelda:A Link Between Worlds", 32, 19, "Adventure", 2013);
INSERT INTO Game VALUES(80, 1, 25, 20, "The Legend of Zelda:Tri Force Heroes", 20, 25, "Adventure", 2015);
INSERT INTO Game VALUES(81, 3, 1, 16, "Shogun:Total War", 30, 26, "Strategy", 2000);
INSERT INTO Game VALUES(82, 3, 1, 16, "Medieval:Total War", 25, 31, "Strategy", 2002);
INSERT INTO Game VALUES(83, 3, 1, 16, "Rome:Total War", 30, 30, "Strategy", 2004);
INSERT INTO Game VALUES(84, 3, 1, 16, "Medieval II:Total War", 31, 25, "Strategy", 2006);
INSERT INTO Game VALUES(85, 3, 1, 16, "Empire:Total War", 22, 25, "Strategy", 2009);
INSERT INTO Game VALUES(86, 3, 1, 16, "Napoleon:Total War", 30, 25, "Strategy", 2010);
INSERT INTO Game VALUES(87, 3, 1, 16, "Total War: Shogun 2", 30, 26, "Strategy", 2011);
INSERT INTO Game VALUES(88, 3, 1, 16, "Total War: Rome 2", 30, 30, "Strategy", 2013);
INSERT INTO Game VALUES(89, 3, 1, 16, "Total War: Atilla", 30, 26, "Strategy", 2015);
INSERT INTO Game VALUES(90, 3, 1, 16, "Total War: Warhammer", 30, 40, "Strategy", 2016);
INSERT INTO Game VALUES(91, 3, 1, 16, "Total War: Warhammer II", 40, 41, "Strategy", 2017);
INSERT INTO Game VALUES(92, 3, 1, 16, "Total War Saga: Thrones of Britannia", 40, 28, "Strategy", 2018);
INSERT INTO Game VALUES(93, 3, 1, 16, "Total War: Three Kingdoms", 60, 40, "Strategy", 2019);
INSERT INTO Game VALUES(94, 3, 1, 16, "Total War Saga: Thrones of Britannia", 60, 40, "Strategy", 2020);
INSERT INTO Game VALUES(95, 3, 1, 16, "Total War: Warhammer III", 60, 41, "Strategy", 2022);
INSERT INTO Game VALUES(96, 0, 11, 20, "Super Mario Bros 2", 2000, 3, "PlatFormer", 1988);
INSERT INTO Game VALUES(97, 0, 11, 20, "Super Mario Bros 3", 411, 6, "PlatFormer", 1988);
INSERT INTO Game VALUES(98, 0, 13, 20, "Donkeykong 64", 242, 29, "PlatFormer", 1999);
INSERT INTO Game VALUES(99, 0, 13, 20, "Super Mario 64", 1362, 12, "PlatFormer", 1996);
INSERT INTO Game VALUES(100, 0, 13, 20, "Mario Kart 64", 66, 5, "Racing", 1996);

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
INSERT INTO UserPurchases Values(0, "Cecilia", 11011, 21, "vnjfjf", "vivatwefmeb@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Saskia", 12011, 21, "asdfasd", "aaf@outlookbox.me");
INSERT INTO UserPurchases Values(54, "Bethany", 13011, 21, "cvx", "ddffs@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Brayden", 14011, 23, "kjhgffffkjhdfg", "vivatggmeb@outlookbox.me");
INSERT INTO UserPurchases Values(35, "Estelle", 15011, 24, "bfb", "vivarrtmeb@outlookbox.me");
INSERT INTO UserPurchases Values(33, "Tanya", 16011, 21, "gsgssg", "vivarrtmeb@outlookbox.me");
INSERT INTO UserPurchases Values(54, "Aaliyah", 17011, 21, "84894", "vivateeegwmeb@outlookbox.me");
INSERT INTO UserPurchases Values(66, "Wojciech", 18011, 21, "kljmg", "agrig@outlookbox.me");
INSERT INTO UserPurchases Values(22, "Kayleigh", 19011, 19, "fkjf9", "agis@outlookbox.me");
INSERT INTO UserPurchases Values(33, "Hanna", 2011, 44, "foifj292f", "beta@outlookbox.me");
INSERT INTO UserPurchases Values(44, "Eloise", 30011, 51, "man vake", "theta@outlookbox.me");
INSERT INTO UserPurchases Values(55, "Alexander", 40011, 21, "asdf2", "aplha@outlookbox.me");
INSERT INTO UserPurchases Values(55, "Eleni", 50011, 41, "oapigu29", "nu@outlookbox.me");
INSERT INTO UserPurchases Values(55, "Kathleen", 60011, 11, "zxcvzx", "lamda@outlookbox.me");
INSERT INTO UserPurchases Values(33, "Catherine", 70011, 91, "kjhbcbcgkjhdfg", "jfw@outlookbox.me");
INSERT INTO UserPurchases Values(44, "Levi", 80011, 81, "kjhgkjhncdfg", "eargeg@outlookbox.me");
INSERT INTO UserPurchases Values(88, "Evelyn", 90011, 61, "kjhgvccvckjhdfg", "vivafkgjsfgtmeb@outlookbox.me");
INSERT INTO UserPurchases Values(99, "walter", 22011, 51, "dsf", "banbeo@outlookbox.me");
INSERT INTO UserPurchases Values(88, "Jay", 34011, 31, "sdfsfga", "bemo@outlookbox.me");
INSERT INTO UserPurchases Values(76, "Hasan", 24011, 26, "agag", "dog@outlookbox.me");
INSERT INTO UserPurchases Values(65, "Hasnain", 25011, 27, "kjhgkagasgjhdfg", "cato@outlookbox.me");
INSERT INTO UserPurchases Values(54, "Minnie", 26011, 81, "ag", "spring@outlookbox.me");
INSERT INTO UserPurchases Values(66, "Eesa", 27011, 44, "kjhgkjagagahdfg", "summer@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Marie", 23011, 43, "agagag", "march@outlookbox.me");
INSERT INTO UserPurchases Values(87, "Lochlan", 35011, 44, "agagag", "septum@outlookbox.me");
INSERT INTO UserPurchases Values(54, "lee", 36011, 53, "kjhgkjkfljgklhdfg", "elder@outlookbox.me");
INSERT INTO UserPurchases Values(23, "Zara", 37011, 57, "fgdgd", "makr@outlookbox.me");
INSERT INTO UserPurchases Values(25, "Carol", 38011, 89, "kjhgasdasdgkjhdfg", "maki33@outlookbox.me");
INSERT INTO UserPurchases Values(27, "Yahya", 39011, 34, "kjhgkjhdfgqgqgg", "uwrgrsg@outlookbox.me");
INSERT INTO UserPurchases Values(27, "Mercedes", 41011, 51, "kjhgkjhddfsfdshfg", "ceiling@outlookbox.me");
INSERT INTO UserPurchases Values(28, "Wikto", 42011, 61, "kjhgkjhdfxzbbsgg", "ice@outlookbox.me");
INSERT INTO UserPurchases Values(86, "Victor", 43011, 91, "kjhgkjhdfsfdgdsg", "fire@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Georgina", 44011, 25, "kjhgkjhdfsdfgsg", "deaht93@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Ernest", 45011, 35, "kjhgkjhgsgdfg", "magic28@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Fred", 46011, 64, "kjhgkjhdfrrrg", "wizard3@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Fredric", 47011, 43, "kjhgkjhrwd767fg", "feaster3@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Alexis", 48011, 64, "kjhgkjhd46262fg", "Knifves222@outlookbox.me");
INSERT INTO UserPurchases Values(57, "Helena", 49011, 54, "kjhgkjhd878fg", "beaster@outlookbox.me");
INSERT INTO UserPurchases Values(44, "Roger", 50011, 43, "kjhgkjhdf6786g", "Rememberance@outlookbox.me");
INSERT INTO UserPurchases Values(23, "Alex", 51011, 54, "kjhgkjhd633fg", "Door93@outlookbox.me");
INSERT INTO UserPurchases Values(24, "Vinnie", 52011, 33, "kjhgkjhd22fg", "Passage3@outlookbox.me");
INSERT INTO UserPurchases Values(34, "Gabrielle", 53011, 83, "kjhgk1j44hdfg", "Before922@outlookbox.me");
INSERT INTO UserPurchases Values(77, "alistair", 54011, 28, "kjhgkjhd44fg", "Relaxing3@outlookbox.me");
INSERT INTO UserPurchases Values(99, "Louis", 55011, 92, "kjhgkjhd11fg", "Nightmare@outlookbox.me");
INSERT INTO UserPurchases Values(87, "Eden", 56011, 38, "kjhgkjhdf22g", "Screamo3@outlookbox.me");
INSERT INTO UserPurchases Values(86, "Theodor", 57011, 47, "kjhgkjh3dfg", "Yealling024@outlookbox.me");
INSERT INTO UserPurchases Values(83, "nell", 58011, 58, "kjhgkjhdfg3", "Suffero29r@outlookbox.me");
INSERT INTO UserPurchases Values(86, "Troy", 59011, 33, "kjhgkjh6dfg", "Guitar02@outlookbox.me");
INSERT INTO UserPurchases Values(86, "Bailey", 61011, 21, "kjh8gkjhdfg", "Why3@outlookbox.me");
INSERT INTO UserPurchases Values(84, "Theresa", 62011, 21, "kjhagk4jhdfg", "Help33@outlookbox.me");
INSERT INTO UserPurchases Values(83, "Zahra", 63011, 21, "kjhgkjhdfg", "FallingApart2@outlookbox.me");
INSERT INTO UserPurchases Values(88, "Christine", 64011, 21, "kjahgkjhdfg", "Two@outlookbox.me");
INSERT INTO UserPurchases Values(55, "Aimee", 65011, 21, "kjhgkjhsdfg", "threeeeeeeeee@outlookbox.me");
INSERT INTO UserPurchases Values(33, "Ella", 67011, 21, "kjhgkjhddfg", "WOOOOOOOOOOOOO3@outlookbox.me");
INSERT INTO UserPurchases Values(34, "Tristen", 66011, 21, "kjhgkjfhdfg", "ofefe@outlookbox.me");
INSERT INTO UserPurchases Values(36, "Krish", 68011, 21, "kjhgkjhdfeg", "walking23@outlookbox.me");
INSERT INTO UserPurchases Values(27, "Luis", 69911, 58, "kjhgkjhdefg", "Walkerman3@outlookbox.me");
INSERT INTO UserPurchases Values(72, "Luisa", 71011, 46, "kjhgkjhdwfg", "Statue32@outlookbox.me");
INSERT INTO UserPurchases Values(54, "Irene", 72011, 35, "kjhgkjasdghdfg", "Bongo2@outlookbox.me");
INSERT INTO UserPurchases Values(76, "Herman", 73011, 35, "kjhgkjhdcvfg", "King2@outlookbox.me");
INSERT INTO UserPurchases Values(54, "Emi", 74011, 45, "kjhgkjhdfvccg", "Queeen@outlookbox.me");
INSERT INTO UserPurchases Values(43, "Emilia", 75011, 44, "kjhgkjhdssffg", " mami22@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Emit", 76011, 44, "kjhgkjhdfffg", "Maiam2@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Jonas", 77011, 35, "kjhgkjhwqwdfg", "Moneky@outlookbox.me");
INSERT INTO UserPurchases Values(98, "Darcy", 78011, 35, "kjhgkjhdfqqg", "Jungel@outlookbox.me");
INSERT INTO UserPurchases Values(76, "Xan", 79011, 36, "kjhgkjhyydfg", "citybou@outlookbox.me");
INSERT INTO UserPurchases Values(14, "Xanthe", 80011, 21, "kjhgkuujhdfg", "crown@outlookbox.me");
INSERT INTO UserPurchases Values(26, "Ifen", 81011, 21, "kjhgkjhdiifg", "Peopleoftown@outlookbox.me");
INSERT INTO UserPurchases Values(43, "Ifan", 82011, 21, "kjhgkjhdfoog", "hgeg@outlookbox.me");
INSERT INTO UserPurchases Values(34, "Jess", 83011, 21, "kjhgkjhidfoog", "Kingofbongo@outlookbox.me");
INSERT INTO UserPurchases Values(27, "Mat", 84011, 21, "kjhgkjhuuudfg", "Hitme@outlookbox.me");
INSERT INTO UserPurchases Values(28, "Mateo", 85011, 27, "kjhgkjhjjdfg", "Sickemail@outlookbox.me");
INSERT INTO UserPurchases Values(37, "Omir", 86011, 73, "kjhgkjhdnnfg", "COolname@outlookbox.me");
INSERT INTO UserPurchases Values(0, "Omar", 87011, 76, "kjhgkjhdmmfg", "gello@outlookbox.me");
INSERT INTO UserPurchases Values(43, "May", 88011, 65, "kjhgkjhdf22g", "Boogi@outlookbox.me");
INSERT INTO UserPurchases Values(53, "Mckenzie", 890011, 41, "asdgkjadsgjhdfg", "laptop@outlookbox.me");
INSERT INTO UserPurchases Values(32, "Safwan", 10311, 51, "oisu", "Compou@outlookbox.me");
INSERT INTO UserPurchases Values(63, "Kay", 10511, 51, "argw", "shoemaster@outlookbox.me");
INSERT INTO UserPurchases Values(43, "Kaylen", 10911, 51, "dn892hg92", "Bridgeguy@outlookbox.me");


--Insert Rating Data
INSERT INTO Rating VALUES(0, "E", "3+", "G");
INSERT INTO Rating VALUES(1, "E10+", "12+", "PG 12+");
INSERT INTO Rating VALUES(2, "T", "16+", "PG 15+");
INSERT INTO Rating VALUES(3, "M", "18+", "R 18+");


--insert platform data
INSERT INTO Platform VALUES(1, "PC", "Windows", "PC");
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
INSERT INTO Platform VALUES(23, "GameBoy", "GameBoy system Software", "Nintendo");
INSERT INTO Platform VALUES(24, "Nintendo DS", "DS system Software", "Nintendo");
INSERT INTO Platform VALUES(25, "Nintendo 3DS", "DS system Software", "Nintendo");
INSERT INTO Platform VALUES(26, "New Nintendo 3DS", "New 3DS system Software", "Nintendo");
INSERT INTO Platform VALUES(27, "Super Famicom", "Famicom Software", "Nintendo");


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