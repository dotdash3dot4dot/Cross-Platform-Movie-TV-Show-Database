-- Creating Description Table

Select * from MediaContent
CREATE TABLE EntertainmentDescription(
DescID VARCHAR(20) NOT NULL PRIMARY KEY,
DescCast VARCHAR(100),
DescSynopsis VARCHAR(1000),
DescDirector VARCHAR(50),
DescMusicComposer VARCHAR(50),
DescRunningTime VARCHAR(10),
);

CREATE TABLE Rating(
RatingID VARCHAR(20) NOT NULL PRIMARY KEY,
RatingScore DECIMAL(2,1) NOT NULL,
ReviewedBy VARCHAR(10) NOT NULL,
);

CREATE TABLE MediaContent(
MediaContentID VARCHAR(20) NOT NULL PRIMARY KEY,
MediaContentName VARCHAR(30) NOT NULL,
MediaContentType VARCHAR(30) NOT NULL,
DescID VARCHAR(20) FOREIGN KEY REFERENCES EntertainmentDescription(DescID),
RatingID VARCHAR(20) FOREIGN KEY REFERENCES Rating(RatingID),
);

CREATE TABLE Platforms(
PlatformID VARCHAR(20) NOT NULL PRIMARY KEY,
PlatformName VARCHAR(30) NOT NULL,
);

CREATE TABLE Location(
LocationID VARCHAR(20) NOT NULL PRIMARY KEY,
LocationName VARCHAR(40) NOT NULL,
LocationCurrencyType VARCHAR(10) NOT NULL,
);

CREATE TABLE Genre(
GenreID VARCHAR(20) NOT NULL PRIMARY KEY,
GenreName VARCHAR(30) NOT NULL,
);

CREATE TABLE Price(
PriceID VARCHAR(20) NOT NULL PRIMARY KEY,
Price Decimal(6,2) NOT NULL,
);

CREATE TABLE MediaContentLocDetails(
MediaContentID VARCHAR(20) NOT NULL,
LocationID VARCHAR(20) NOT NULL,
PriceID VARCHAR(20) NOT NULL,
PlatformID VARCHAR(20) NOT NULL
constraint MediaContentLocDetails_PK PRIMARY KEY (MediaContentID, LocationID, PriceID, PlatformID),
constraint MediaContentLocDetails_FK1 FOREIGN KEY (MediaContentID) REFERENCES MediaContent(MediaContentID),
constraint MediaContentLocDetails_FK2 FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
constraint MediaContentLocDetails_FK3 FOREIGN KEY (PriceID) REFERENCES Price(PriceID),
constraint MediaContentLocDetails_FK4 FOREIGN KEY (PlatformID) REFERENCES Platforms(PlatformID),
);

CREATE TABLE SubscriptionFee(
LocationID VARCHAR(20) NOT NULL,
PlatformID VARCHAR(20) NOT NULL,
SubscriptionFee Decimal(6,2) NOT NULL,
constraint SubscriptionFee_PK PRIMARY KEY (LocationID, PlatformID),
constraint SubscriptionFee_FK1 FOREIGN KEY (PlatformID) REFERENCES Platforms(PlatformID),
constraint SubscriptionFee_FK2 FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
);

CREATE TABLE ContentGenreDetails(
MediaContentID VARCHAR(20) NOT NULL,
GenreID VARCHAR(20) NOT NULL,
constraint ContentGenreDetails_PK PRIMARY KEY (MediaContentID, GenreID),
constraint ContentGenreDetails_FK1 FOREIGN KEY (MediaContentID) REFERENCES MediaContent(MediaContentID),
constraint ContentGenreDetails_FK2 FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
);

CREATE TABLE MediaLanguage(
LanguageID VARCHAR(20) NOT NULL PRIMARY KEY,
LanguageName VARCHAR(40),
);

CREATE TABLE Customers(
CustID VARCHAR(20) NOT NULL PRIMARY KEY,
CustFName VARCHAR(30) NOT NULL,
CustLName VARCHAR(30) NOT NULL,
CustEmail VARCHAR(30) NOT NULL,
LocationID VARCHAR(20) FOREIGN KEY REFERENCES Location(LocationID),
);

CREATE TABLE CustomerLangDetails(
CustID VARCHAR(20) NOT NULL,
LanguageID VARCHAR(20) NOT NULL,
constraint CustomerLangDetails_PK PRIMARY KEY (CustID, LanguageID),
constraint CustomerLangDetails_FK1 FOREIGN KEY (CustID) REFERENCES Customers(CustID),
constraint CustomerLangDetails_FK2 FOREIGN KEY (LanguageID) REFERENCES MediaLanguage(LanguageID),
);

CREATE TABLE PlatformUsageDetails(
CustID VARCHAR(20) NOT NULL,
PlatformID VARCHAR(20) NOT NULL,
constraint PlatformUsageDetails_PK PRIMARY KEY (CustID, PlatformID),
constraint PlatformUsageDetails_FK1 FOREIGN KEY (CustID) REFERENCES Customers(CustID),
constraint PlatformUsageDetails_FK2 FOREIGN KEY (PlatformID) REFERENCES Platforms(PlatformID),
);

CREATE TABLE CustomerGenreDetails(
CustID VARCHAR(20) NOT NULL,
GenreID VARCHAR(20) NOT NULL,
constraint CustomerGenreDetails_PK PRIMARY KEY (CustID, GenreID),
constraint CustomerGenreDetails_FK1 FOREIGN KEY (CustID) REFERENCES Customers(CustID),
constraint CustomerGenreDetails_FK2 FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
);

CREATE TABLE MediaContentLangDetails(
MediaContentID VARCHAR(20) NOT NULL,
LanguageID VARCHAR(20) NOT NULL,
constraint MediaContentLangDetails_PK PRIMARY KEY (MediaContentID, LanguageID),
constraint MediaContentLangDetails_FK1 FOREIGN KEY (MediaContentID) REFERENCES MediaContent(MediaContentID),
constraint MediaContentLangDetails_FK2 FOREIGN KEY (LanguageID) REFERENCES MediaLanguage(LanguageID),
);

Select * from sys.tables

INSERT INTO EntertainmentDescription(DescID, DescCast, DescDirector, DescSynopsis, DescMusicComposer, DescRunningTime) VALUES (1111, 'Akshay Kumar, Mouni Roy, Kunal Kapoor', 'Reema Kagti', 'Set in 1948, the historical story of first Olympic medal posts the independence of India', 'Sachin-Jigar', 145)
INSERT INTO EntertainmentDescription(DescID, DescCast, DescDirector, DescSynopsis, DescMusicComposer, DescRunningTime) VALUES (1112, 'Jason Momoa, Amber Heard, Willem Dafoe', 'James Wan', '"Aquaman" reveals the origin story of half-human, half-Atlantean Arthur Curry and takes him on the journey of his lifetime-to discover if he is worthy of who he was born to be a king.', 'Rupert Gregson-Williams', 143)
INSERT INTO EntertainmentDescription(DescID, DescCast, DescDirector, DescSynopsis, DescMusicComposer, DescRunningTime) VALUES (1113, 'Jesse Plemons, Cristin Milioti, Jimmi Simpson', 'Charlie Brooker', 'This sci-fi anthology series explores a twisted, high-tech near-future where greatest innovations and darkest instincts of humans collide',NULL,NULL)
INSERT INTO EntertainmentDescription(DescID, DescCast, DescDirector, DescSynopsis, DescMusicComposer, DescRunningTime) VALUES (1114, 'Michaela Watkins, Tommy Dewey, Tara Lynne Barr, Nyasha Hatendi, Frances Conroy, Julie Berman', 'Zander Lehmann', 'A new comedy series about a bachelor brother and his newly divorced sister living under one roof again.',NULL, 45)
INSERT INTO EntertainmentDescription(DescID, DescCast, DescDirector, DescSynopsis, DescMusicComposer, DescRunningTime) VALUES (1115, 'Craig T. Nelson, Holly Hunter, Sarah Vowell', 'Brad Bird', 'The Incredibles hero family takes on a new mission, which involves a change in family roles', 'Michael Giacchino', 125)

Select * from EntertainmentDescription;


INSERT INTO Rating(RatingID, RatingScore, ReviewedBy) VALUES (1121, 7.5, 'IMDb')
INSERT INTO Rating(RatingID, RatingScore, ReviewedBy) VALUES (1122, 4.6, 'IMDb')
INSERT INTO Rating(RatingID, RatingScore, ReviewedBy) VALUES (1123, 8.9, 'IMDb')
INSERT INTO Rating(RatingID, RatingScore, ReviewedBy) VALUES (1124, 3, 'IMDb')
INSERT INTO Rating(RatingID, RatingScore, ReviewedBy) VALUES (1125, 7.7, 'IMDb')

Select * from Rating;

INSERT INTO MediaContent(MediaContentID, MediaContentName, MediaContentType, DescID, RatingID) VALUES ('M1131', 'Gold', 'Movie', 1111, 1121)
INSERT INTO MediaContent(MediaContentID, MediaContentName, MediaContentType, DescID, RatingID) VALUES ('M1132', 'Aquaman', 'Movie', 1112, 1122)
INSERT INTO MediaContent(MediaContentID, MediaContentName, MediaContentType, DescID, RatingID) VALUES ('M1133', 'Black Mirror - Series 1', 'TV Show', 1113, 1123)
INSERT INTO MediaContent(MediaContentID, MediaContentName, MediaContentType, DescID, RatingID) VALUES ('M1134', 'Casual - Season 1', 'TV Show', 1114, 1124)
INSERT INTO MediaContent(MediaContentID, MediaContentName, MediaContentType, DescID, RatingID) VALUES ('M1135', 'Incredibles 2', 'Movie', 1115, 1125)

Select * from MediaContent;


INSERT INTO Platforms(PlatformID, PlatformName) VALUES ('A1141', 'Amazon Prime')
INSERT INTO Platforms(PlatformID, PlatformName) VALUES ('G1142', 'Google Play')
INSERT INTO Platforms(PlatformID, PlatformName) VALUES ('Y1143', 'Youtube')
INSERT INTO Platforms(PlatformID, PlatformName) VALUES ('N1144', 'Netflix')
INSERT INTO Platforms(PlatformID, PlatformName) VALUES ('H1145', 'Hulu')

Select * from Platforms;

INSERT INTO Location(LocationID, LocationName, LocationCurrencyType) VALUES ('US151', 'USA', 'USD')
INSERT INTO Location(LocationID, LocationName, LocationCurrencyType) VALUES ('IN152', 'India', 'Rupees')
Select * from Location;

INSERT INTO Genre(GenreID, GenreName) VALUES ('S1165', 'Sci-Fi')
INSERT INTO Genre(GenreID, GenreName) VALUES ('A1165', 'Action')
INSERT INTO Genre(GenreID, GenreName) VALUES ('C1164', 'Comedy')
INSERT INTO Genre(GenreID, GenreName) VALUES ('S1161', 'Sports')
INSERT INTO Genre(GenreID, GenreName) VALUES ('D1161', 'Drama')
INSERT INTO Genre(GenreID, GenreName) VALUES ('S1163', 'Satire')
INSERT INTO Genre(GenreID, GenreName) VALUES ('T1163', 'Thriller')

Select * from Genre;

INSERT INTO Price(PriceID, Price) VALUES ('USD1171', 0)
INSERT INTO Price(PriceID, Price) VALUES ('USD1172', 12.99)
INSERT INTO Price(PriceID, Price) VALUES ('RS1172', 2500)
INSERT INTO Price(PriceID, Price) VALUES ('USD1173', 27.25)
INSERT INTO Price(PriceID, Price) VALUES ('USD1174', 6.99)
INSERT INTO Price(PriceID, Price) VALUES ('USD1175', 14.99)
INSERT INTO Price(PriceID, Price) VALUES ('RS1175', 1000)
INSERT INTO Price(PriceID, Price) VALUES ('USD1176', 10.99)
INSERT INTO Price(PriceID, Price) VALUES ('USD1177', 17.99)

Select * from Price;

INSERT INTO MediaContentLocDetails(MediaContentID, LocationID, PriceID, PlatformID) VALUES ('M1131', 'US151', 'USD1171', 'A1141')
INSERT INTO MediaContentLocDetails(MediaContentID, LocationID, PriceID, PlatformID) VALUES ('M1132', 'US151', 'USD1172', 'G1142')
INSERT INTO MediaContentLocDetails(MediaContentID, LocationID, PriceID, PlatformID) VALUES ('M1132', 'IN152', 'RS1172', 'A1141')
INSERT INTO MediaContentLocDetails(MediaContentID, LocationID, PriceID, PlatformID) VALUES ('M1133', 'US151', 'USD1173', 'A1141')
INSERT INTO MediaContentLocDetails(MediaContentID, LocationID, PriceID, PlatformID) VALUES ('M1133', 'US151', 'USD1176', 'Y1143')
INSERT INTO MediaContentLocDetails(MediaContentID, LocationID, PriceID, PlatformID) VALUES ('M1134', 'US151', 'USD1174', 'N1144')
INSERT INTO MediaContentLocDetails(MediaContentID, LocationID, PriceID, PlatformID) VALUES ('M1134', 'US151', 'USD1177', 'H1145')
INSERT INTO MediaContentLocDetails(MediaContentID, LocationID, PriceID, PlatformID) VALUES ('M1135', 'US151', 'USD1175', 'A1141')
INSERT INTO MediaContentLocDetails(MediaContentID, LocationID, PriceID, PlatformID) VALUES ('M1135', 'IN152', 'RS1175', 'A1141')

Select * from MediaContentLocDetails;

INSERT INTO ContentGenreDetails (MediaContentID, GenreID) VALUES ('M1131', 'S1161')
INSERT INTO ContentGenreDetails (MediaContentID, GenreID) VALUES ('M1131', 'D1161')
INSERT INTO ContentGenreDetails (MediaContentID, GenreID) VALUES ('M1132', 'A1165')
INSERT INTO ContentGenreDetails (MediaContentID, GenreID) VALUES ('M1133', 'S1163')
INSERT INTO ContentGenreDetails (MediaContentID, GenreID) VALUES ('M1133', 'T1163')
INSERT INTO ContentGenreDetails (MediaContentID, GenreID) VALUES ('M1134', 'C1164')
INSERT INTO ContentGenreDetails (MediaContentID, GenreID) VALUES ('M1135', 'S1165')
INSERT INTO ContentGenreDetails (MediaContentID, GenreID) VALUES ('M1135', 'A1165')

Select * from ContentGenreDetails;

INSERT INTO MediaLanguage(LanguageID, LanguageName) VALUES ('E1181', 'English(US)')
INSERT INTO MediaLanguage(LanguageID, LanguageName) VALUES ('E1182', 'Hindi')
INSERT INTO MediaLanguage(LanguageID, LanguageName) VALUES ('E1183', 'Mandarin')

Select * from MediaLanguage;

INSERT INTO Customers(CustID, CustFName, CustLName, CustEmail, LocationID) VALUES ('C1191', 'Alex', 'McClurg', 'alex@gmail.com', 'US151')
INSERT INTO Customers(CustID, CustFName, CustLName, CustEmail,LocationID) VALUES ('C1192', 'Aishwarya', 'Soundararajan', 'ashrajan@gmail.com', 'IN152')
INSERT INTO Customers(CustID, CustFName, CustLName, CustEmail, LocationID) VALUES ('C1193', 'Aditi', 'Ganesh', 'adganesh@gmail.com', 'IN152')
INSERT INTO Customers(CustID, CustFName, CustLName, CustEmail, LocationID) VALUES ('C1194', 'Shreya', 'Sharma', 'ssharma@gmail.com', 'IN152')
INSERT INTO Customers(CustID, CustFName, CustLName, CustEmail, LocationID) VALUES ('C1195', 'Dave', 'Philips', 'dphilips@gmail.com', 'US151')

Select * from Customers;

INSERT INTO CustomerLangDetails(CustID,LanguageID) VALUES ('C1191', 'E1181')
INSERT INTO CustomerLangDetails(CustID,LanguageID) VALUES ('C1192', 'E1182')
INSERT INTO CustomerLangDetails(CustID,LanguageID) VALUES ('C1193', 'E1183')
INSERT INTO CustomerLangDetails(CustID,LanguageID) VALUES ('C1194', 'E1181')
INSERT INTO CustomerLangDetails(CustID,LanguageID) VALUES ('C1195', 'E1181')

Select * from CustomerLangDetails;

INSERT INTO PlatformUsageDetails(CustID,PlatformID) VALUES ('C1191', 'A1141')
INSERT INTO PlatformUsageDetails(CustID,PlatformID) VALUES ('C1191', 'G1142')
INSERT INTO PlatformUsageDetails(CustID,PlatformID) VALUES ('C1192', 'G1142')
INSERT INTO PlatformUsageDetails(CustID,PlatformID) VALUES ('C1193', 'Y1143')
INSERT INTO PlatformUsageDetails(CustID,PlatformID) VALUES ('C1194', 'N1144')
INSERT INTO PlatformUsageDetails(CustID,PlatformID) VALUES ('C1195', 'H1145')

Select * from PlatformUsageDetails;

INSERT INTO CustomerGenreDetails(CustID,GenreID) VALUES ('C1191', 'A1165')
INSERT INTO CustomerGenreDetails(CustID,GenreID) VALUES ('C1192', 'S1161')
INSERT INTO CustomerGenreDetails(CustID,GenreID) VALUES ('C1193', 'C1164')
INSERT INTO CustomerGenreDetails(CustID,GenreID) VALUES ('C1194', 'S1165')
INSERT INTO CustomerGenreDetails(CustID,GenreID) VALUES ('C1195', 'D1161')

Select * from CustomerGenreDetails;

INSERT INTO MediaContentLangDetails(MediaContentID,LanguageID) VALUES ('M1131', 'E1181')
INSERT INTO MediaContentLangDetails(MediaContentID,LanguageID) VALUES ('M1132', 'E1181')
INSERT INTO MediaContentLangDetails(MediaContentID,LanguageID) VALUES ('M1132', 'E1182')
INSERT INTO MediaContentLangDetails(MediaContentID,LanguageID) VALUES ('M1133', 'E1181')
INSERT INTO MediaContentLangDetails(MediaContentID,LanguageID) VALUES ('M1134', 'E1181')
INSERT INTO MediaContentLangDetails(MediaContentID,LanguageID) VALUES ('M1135', 'E1181')
INSERT INTO MediaContentLangDetails(MediaContentID,LanguageID) VALUES ('M1135', 'E1182')

Select * from MediaContentLangDetails;

INSERT INTO SubscriptionFee(PlatformID,LocationID, SubscriptionFee) VALUES ('A1141', 'US151', 12.99)
INSERT INTO SubscriptionFee(PlatformID,LocationID, SubscriptionFee) VALUES ('G1142', 'US151', 9.99)
INSERT INTO SubscriptionFee(PlatformID,LocationID, SubscriptionFee) VALUES ('A1141', 'IN152', 950)
INSERT INTO SubscriptionFee(PlatformID,LocationID, SubscriptionFee) VALUES ('Y1143', 'US151', 6.99)
INSERT INTO SubscriptionFee(PlatformID,LocationID, SubscriptionFee) VALUES ('N1144', 'US151', 7.99)
INSERT INTO SubscriptionFee(PlatformID,LocationID, SubscriptionFee) VALUES ('H1145', 'US151', 5.99)

Select * from SubscriptionFee;

-- Data Questions

-- 1) In which platform is 'Aquaman' movie available?

SELECT MediaContent.MediaContentName, Platforms.PlatformName FROM MediaContent
INNER JOIN MediaContentLocDetails
ON MediaContent.MediaContentID = MediaContentLocDetails.MediaContentID
INNER JOIN Platforms
ON Platforms.PlatformID = MediaContentLocDetails.PlatformID
WHERE MediaContentName = 'Aquaman'

-- 2) What are the available movie / TV shows in 'Action' genre?

SELECT MC.MediaContentName, G.GenreName FROM MediaContent as MC
INNER JOIN ContentGenreDetails as MediaGenre
ON MC.MediaContentID = MediaGenre.MediaContentID
INNER JOIN Genre G
ON G.GenreID = MediaGenre.GenreID
WHERE G.GenreName = 'Action'

-- 3) What are the movies/ Tv shows available in 'English(US)' language?

SELECT MC.MediaContentName, ML.LanguageName FROM MediaContent AS MC
INNER JOIN MediaContentLangDetails as Lang
ON MC.MediaContentID = Lang.MediaContentID
INNER JOIN MediaLanguage as ML
ON ML.LanguageID = Lang.LanguageID
WHERE ML.LanguageName = 'English(US)'

-- 4) What are the preferred movie genres for customerID 'C1195'?

SELECT G.GenreName, C.CustID, C.CustFName, C.CustLName FROM Genre as G
INNER JOIN CustomerGenreDetails as CustGenre
ON G.GenreID = CustGenre.GenreID
INNER JOIN Customers as C
ON C.CustID = CustGenre.CustID
where C.CustID = 'C1195'

-- 5) What is most popular language among customers?

SELECT TOP 1 LanguageName, COUNT(LanguageName) 'Number of Customers' FROM CustomerLangDetails 
INNER JOIN MediaLanguage 
ON MediaLanguage.LanguageID = CustomerLangDetails.LanguageID
GROUP BY LanguageName

-- 6) What is most favourite genre among customers?

SELECT TOP 1 GenreName, COUNT(GenreName) 'Most Favorite Genre' FROM GENRE
INNER JOIN ContentGenreDetails
ON ContentGenreDetails.GenreID = Genre.GenreID
GROUP BY GenreName

--7) List of movies/TV shows available in different Platform along with their location and price details

SELECT MC.MediaContentType, MC.MediaContentName, PL.PlatformName, Location.LocationName,Location.LocationCurrencyType, P.Price,S.SubscriptionFee, (P.Price + S.SubscriptionFee) 'Total Price' FROM Price AS P
INNER JOIN MediaContentLocDetails AS MContent
ON MContent.PriceID = P.PriceID
INNER JOIN SubscriptionFee AS S
ON MContent.LocationID = S.LocationID AND MContent.PlatformID = S.PlatformID
INNER JOIN Platforms AS PL
ON PL.PlatformID = MContent.PlatformID
INNER JOIN MediaContent MC
ON MC.MediaContentID = MContent.MediaContentID
INNER JOIN Location
ON MContent.LocationID = Location.LocationID
ORDER BY MediaContentType


-- 8) Given a movie, show the cheapest offering
SELECT MediaContentType, MediaContentName, PlatformName, LocationName,LocationCurrencyType, Price,SubscriptionFee, (Price + SubscriptionFee) 'Total Price' FROM(SELECT MC.MediaContentType, MC.MediaContentName, PL.PlatformName, Location.LocationName,Location.LocationCurrencyType, P.Price,S.SubscriptionFee, (P.Price + S.SubscriptionFee) 'Total Price', rank() over(partition by MC.MediaContentName, Location.LocationName,Location.LocationCurrencyType order by (P.Price + S.SubscriptionFee))as rnk FROM Price AS P
INNER JOIN MediaContentLocDetails AS MContent
ON MContent.PriceID = P.PriceID
INNER JOIN SubscriptionFee AS S
ON MContent.LocationID = S.LocationID AND MContent.PlatformID = S.PlatformID
INNER JOIN Platforms AS PL
ON PL.PlatformID = MContent.PlatformID
INNER JOIN MediaContent MC
ON MC.MediaContentID = MContent.MediaContentID
INNER JOIN Location
ON MContent.LocationID = Location.LocationID)rnk
where MediaContentName = 'Black Mirror - Series 1' and LocationName = 'USA' and rnk = 1;

--9) Show the movie info
SELECT MC.MediaContentType, MC.MediaContentName, D.DescSynopsis, D.DescCast, D.DescDirector, D.DescMusicComposer, D.DescRunningTime, R.RatingScore FROM MediaContent AS MC
INNER JOIN EntertainmentDescription AS D
ON D.DescID = MC.DescID
INNER JOIN Rating AS R
ON R.RatingID = MC.RatingID
ORDER BY MediaContentType

--10) top rated movies of a particular genre and under certain price
SELECT MC.MediaContentType, MC.MediaContentName, PL.PlatformName, G.GenreName, Max(R.RatingScore) AS Rating, P.Price, S.SubscriptionFee, (P.Price + S.SubscriptionFee) 'Total Price', Location.LocationName, Location.LocationCurrencyType FROM Price AS P
INNER JOIN MediaContentLocDetails AS MContent
ON MContent.PriceID = P.PriceID
INNER JOIN SubscriptionFee AS S
ON MContent.LocationID = S.LocationID AND MContent.PlatformID = S.PlatformID
INNER JOIN Platforms AS PL
ON PL.PlatformID = MContent.PlatformID
INNER JOIN MediaContent MC
ON MC.MediaContentID = MContent.MediaContentID
INNER JOIN ContentGenreDetails AS CG
ON CG.MediaContentID = MC.MediaContentID
INNER JOIN Genre AS G
ON G.GenreID = CG.GenreID
INNER JOIN Rating AS R
ON R.RatingID = MC.RatingID
INNER JOIN Location
ON MContent.LocationID = Location.LocationID 
WHERE G.GenreName = 'Thriller' AND (P.Price + S.SubscriptionFee) between 15 AND 25
GROUP BY R.RatingScore, MC.MediaContentType, MC.MediaContentName, PL.PlatformName, G.GenreName, P.Price, S.SubscriptionFee, (P.Price + S.SubscriptionFee), Location.LocationName, Location.LocationCurrencyType

-- 11) list all movies/group by platform, genre
SELECT PL.PlatformName, G.GenreName, MC.MediaContentType, MC.MediaContentName FROM MediaContent AS MC
INNER JOIN MediaContentLocDetails AS MContent
ON MC.MediaContentID = MContent.MediaContentID
INNER JOIN Platforms AS PL
ON PL.PlatformID = MContent.PlatformID
INNER JOIN ContentGenreDetails AS CG
ON CG.MediaContentID = MC.MediaContentID
INNER JOIN Genre AS G
ON G.GenreID = CG.GenreID
GROUP BY PL.PlatformName, G.GenreName, MC.MediaContentType, MC.MediaContentName



