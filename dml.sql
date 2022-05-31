use blooddonors
go

INSERT [dbo].[donors] ([donorID], [donorName], [donorAddress]) VALUES (1, N'Ajmat Molla', N'Kazipara, Dhaka')
GO
INSERT [dbo].[donors] ([donorID], [donorName], [donorAddress]) VALUES (2, N'Rahim Uddin', N'Ullapara, Bogura')
GO
INSERT [dbo].[donors] ([donorID], [donorName], [donorAddress]) VALUES (3, N'Salek Mi', N'Uttara, Dhaka')
GO
INSERT [dbo].[donors] ([donorID], [donorName], [donorAddress]) VALUES (4, N'Hemayet', N'Sadullapur')
GO
INSERT [dbo].[donors] ([donorID], [donorName], [donorAddress]) VALUES (5, N'Karim Robi', N'Sadullapur')
GO

INSERT [dbo].[hospitals] ([hospitalID], [hospitalName]) VALUES (1, N'Digi Center')
GO
INSERT [dbo].[hospitals] ([hospitalID], [hospitalName]) VALUES (2, N'Medinova')
GO
INSERT [dbo].[hospitals] ([hospitalID], [hospitalName]) VALUES (3, N'Appollo')
GO
INSERT [dbo].[hospitals] ([hospitalID], [hospitalName]) VALUES (4, N'Square')
GO
INSERT [dbo].[hospitals] ([hospitalID], [hospitalName]) VALUES (5, N'Ever Care')
GO

INSERT [dbo].[patients] ([patiantID], [patiantName], [bloodGroup], [patiantAddress], [payment], [hospitalID]) VALUES (1, N'Abul Hasan', N'B+', N'Mirpur, Dhaka', 9000.0000, 1)
GO
INSERT [dbo].[patients] ([patiantID], [patiantName], [bloodGroup], [patiantAddress], [payment], [hospitalID]) VALUES (2, N'Rajab Ali', N'A+', N'Uttara Dhaka', 200000.0000, 2)
GO
INSERT [dbo].[patients] ([patiantID], [patiantName], [bloodGroup], [patiantAddress], [payment], [hospitalID]) VALUES (3, N'Maidul Hasan', N'O-', N'Uttara Dhaka', 230000.0000, 3)
GO
INSERT [dbo].[patients] ([patiantID], [patiantName], [bloodGroup], [patiantAddress], [payment], [hospitalID]) VALUES (4, N'Masud Ran', N'AB+', N'Dhanmondi', 40000.0000, 4)
GO
USE [blooddonors]
GO
INSERT [dbo].[patiantDonors] ([donationID], [donorID], [patiantID], [timeOfDonation]) VALUES (1, 1, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[patiantDonors] ([donationID], [donorID], [patiantID], [timeOfDonation]) VALUES (2, 2, 3, CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[patiantDonors] ([donationID], [donorID], [patiantID], [timeOfDonation]) VALUES (3, 3, 4, CAST(N'2022-01-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[patiantDonors] ([donationID], [donorID], [patiantID], [timeOfDonation]) VALUES (4, 4, 2, CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
--procedure
EXEC spInsertDonors  'Amirul', 'Keranigonj'
 GO
SELECT * FROM donors
 GO
EXEC spUpdateDonors 6, 'Amirul Islam', 'Keranigonj, Dhaka'
 GO
SELECT * FROM donors
GO
EXEC  spDeleteDonors 6
GO
SELECT * FROM donors
GO
EXEC spInsertHospitals 'Medicare'
GO
SELECT * FROM hospitals
GO
EXEC spUpdateHospitals 6, 'Medicare Hospital'
GO
SELECT * FROM hospitals
GO
EXEC spDeleteHospitals 6
GO
SELECT * FROM hospitals
GO
EXEC spInsertpatients 'Abdul Alim', 'A+','Mirpur, Dhaka',21000,5
GO
SELECT * FROM patients
GO
EXEC spUpdatepatients 5, 'Abdul Alim', 'AB+','Mirpur-1, Dhaka',21000,5
GO
SELECT * FROM patients
GO
EXEC spDeletepatients 5
GO
SELECT * FROM patients
GO
EXEC spInsertPatiantDonors 5 ,4, '2022-03-14'	
GO
SELECT * FROM patiantDonors
GO
EXEC spDeletePatiantDonors 5
GO
SELECT * FROM patiantDonors
GO
--views
SELECT * FROM vPatiantDetails
GO
SELECT * FROM vAvailableDonors
GO
--udf
SELECT * FROM fnDonationDetails(1)
GO
SELECT dbo.fnpatients('A+')
go
--trigger
EXEC spInsertDonors  'Amirul', 'Keranigonj'
 GO
EXEC spInsertPatiantDonors 5 ,4, '2022-03-1'	
GO
SELECT * FROM donors
GO
SELECT * FROM patiantDonors
GO
INSERT [dbo].[patiantDonors] ([donationID], [donorID], [patiantID], [timeOfDonation]) VALUES (6, 5, 1, '2022-03-14') --cannot donate in 90 days
go
SELECT * FROM patiantDonors
GO