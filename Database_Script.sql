/****** Object:  Database [DemoApp]    Script Date: 04-10-2020 07:00:55 PM ******/
CREATE DATABASE [DemoApp]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [DemoApp] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [DemoApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoApp] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [DemoApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoApp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DemoApp] SET  MULTI_USER 
GO
ALTER DATABASE [DemoApp] SET ENCRYPTION ON
GO
ALTER DATABASE [DemoApp] SET QUERY_STORE = ON
GO
ALTER DATABASE [DemoApp] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 04-10-2020 07:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[PatientID] [int] NULL,
	[Date] [datetime] NULL,
	[Appointment_Status] [bit] NULL,
	[DoctorComments] [varchar](500) NULL,
	[Bill_Amount] [float] NULL,
	[Bill_Status] [varchar](10) NULL,
	[DoctorNotification] [int] NULL,
	[PatientNotification] [int] NULL,
	[FeedbackStatus] [int] NULL,
	[Disease] [varchar](500) NULL,
	[Prescription] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK__Appointm__DCC1C959BEF9202A] PRIMARY KEY CLUSTERED 
(
	[AppointID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 04-10-2020 07:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](30) NOT NULL,
	[Description] [varchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 04-10-2020 07:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Gender] [varchar](10) NULL,
	[BirthDate] [date] NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Address] [varchar](50) NULL,
	[DeptID] [int] NOT NULL,
	[ChargesPerVisit] [float] NULL,
	[PatientsTreated] [int] NULL,
	[Rating] [float] NULL,
	[Qualification] [varchar](100) NOT NULL,
	[Specialization] [varchar](100) NULL,
	[Work_Experience] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginTable]    Script Date: 04-10-2020 07:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginTable](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](20) NULL,
	[Email] [varchar](30) NOT NULL,
	[Type] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__LoginTab__4DDA28383FC99EAF] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 04-10-2020 07:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Phone] [varchar](12) NULL,
	[Address] [varchar](50) NULL,
	[BirthDate] [date] NULL,
	[Gender] [varchar](6) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Patients__970EC3462A9711D5] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 
GO
INSERT [dbo].[Appointment] ([AppointID], [DoctorID], [PatientID], [Date], [Appointment_Status], [DoctorComments], [Bill_Amount], [Bill_Status], [DoctorNotification], [PatientNotification], [FeedbackStatus], [Disease], [Prescription], [CreatedDate]) VALUES (7, 6, 12, CAST(N'2020-10-03T17:29:23.000' AS DateTime), 0, N'not available', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-03T17:59:12.760' AS DateTime))
GO
INSERT [dbo].[Appointment] ([AppointID], [DoctorID], [PatientID], [Date], [Appointment_Status], [DoctorComments], [Bill_Amount], [Bill_Status], [DoctorNotification], [PatientNotification], [FeedbackStatus], [Disease], [Prescription], [CreatedDate]) VALUES (8, 7, 2, CAST(N'2020-10-03T18:13:50.203' AS DateTime), 1, N'available', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-03T18:21:11.373' AS DateTime))
GO
INSERT [dbo].[Appointment] ([AppointID], [DoctorID], [PatientID], [Date], [Appointment_Status], [DoctorComments], [Bill_Amount], [Bill_Status], [DoctorNotification], [PatientNotification], [FeedbackStatus], [Disease], [Prescription], [CreatedDate]) VALUES (9, 9, 8, CAST(N'2020-10-03T18:13:50.203' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-03T18:28:57.090' AS DateTime))
GO
INSERT [dbo].[Appointment] ([AppointID], [DoctorID], [PatientID], [Date], [Appointment_Status], [DoctorComments], [Bill_Amount], [Bill_Status], [DoctorNotification], [PatientNotification], [FeedbackStatus], [Disease], [Prescription], [CreatedDate]) VALUES (10, 10, 3, CAST(N'2020-10-03T18:13:50.203' AS DateTime), 0, N'not available', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-03T18:30:42.553' AS DateTime))
GO
INSERT [dbo].[Appointment] ([AppointID], [DoctorID], [PatientID], [Date], [Appointment_Status], [DoctorComments], [Bill_Amount], [Bill_Status], [DoctorNotification], [PatientNotification], [FeedbackStatus], [Disease], [Prescription], [CreatedDate]) VALUES (11, 6, 11, CAST(N'2020-10-03T18:13:50.203' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-03T18:31:33.727' AS DateTime))
GO
INSERT [dbo].[Appointment] ([AppointID], [DoctorID], [PatientID], [Date], [Appointment_Status], [DoctorComments], [Bill_Amount], [Bill_Status], [DoctorNotification], [PatientNotification], [FeedbackStatus], [Disease], [Prescription], [CreatedDate]) VALUES (13, 6, 12, CAST(N'2020-10-04T12:04:08.060' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-04T12:17:11.300' AS DateTime))
GO
INSERT [dbo].[Appointment] ([AppointID], [DoctorID], [PatientID], [Date], [Appointment_Status], [DoctorComments], [Bill_Amount], [Bill_Status], [DoctorNotification], [PatientNotification], [FeedbackStatus], [Disease], [Prescription], [CreatedDate]) VALUES (16, 7, 11, CAST(N'2020-10-04T12:04:08.060' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-04T12:19:08.347' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [Description], [IsActive], [CreatedDate]) VALUES (1, N'Dentist', N'Teething troubles? Schedule a dental checkup', 1, CAST(N'2020-10-03T17:29:23.000' AS DateTime))
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [Description], [IsActive], [CreatedDate]) VALUES (2, N'Gynecologist/Obstetrician', N'Explore for women’s health, pregnancy and infertility treatments', 1, CAST(N'2020-10-04T11:39:01.277' AS DateTime))
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [Description], [IsActive], [CreatedDate]) VALUES (3, N'Physiotherapist', N'Pulled a muscle? Get it treated by a trained physiotherapist', 1, CAST(N'2020-10-04T11:39:46.910' AS DateTime))
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [Description], [IsActive], [CreatedDate]) VALUES (4, N'General surgeon', N'Need to get operated? Find the right surgeon', 1, CAST(N'2020-10-04T11:40:23.983' AS DateTime))
GO
INSERT [dbo].[Department] ([DeptID], [DeptName], [Description], [IsActive], [CreatedDate]) VALUES (5, N'Dietitian/Nutrition', N'Get guidance on eating right, weight management and sports nutrition', 1, CAST(N'2020-10-04T11:40:44.540' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 
GO
INSERT [dbo].[Doctor] ([DoctorID], [Name], [Gender], [BirthDate], [PhoneNumber], [Address], [DeptID], [ChargesPerVisit], [PatientsTreated], [Rating], [Qualification], [Specialization], [Work_Experience], [IsActive], [CreatedDate]) VALUES (6, N'Dr. Hemant', N'Male', NULL, N'1256897654', N'Pimple Saudagar,Pune', 1, 300, 29, 4, N'BDS', N'MDS - Prosthodontics', 12, 1, CAST(N'2020-10-03T17:57:56.433' AS DateTime))
GO
INSERT [dbo].[Doctor] ([DoctorID], [Name], [Gender], [BirthDate], [PhoneNumber], [Address], [DeptID], [ChargesPerVisit], [PatientsTreated], [Rating], [Qualification], [Specialization], [Work_Experience], [IsActive], [CreatedDate]) VALUES (7, N'Dr. Jagrati', N'Female', NULL, N'5643237865', N'Wakad,Pune', 2, 500, 45, 3, N'MBBS', N'MD - Obstetrics & Gynaecology', 16, 1, CAST(N'2020-10-04T11:54:02.680' AS DateTime))
GO
INSERT [dbo].[Doctor] ([DoctorID], [Name], [Gender], [BirthDate], [PhoneNumber], [Address], [DeptID], [ChargesPerVisit], [PatientsTreated], [Rating], [Qualification], [Specialization], [Work_Experience], [IsActive], [CreatedDate]) VALUES (9, N'Dr. Amod ', N'Male', NULL, N'7865432345', N'Vishal Nagar', 3, 350, 9, 4, N'MBBS', N'DPM (Psychiatry)', 12, 1, CAST(N'2020-10-04T11:56:12.650' AS DateTime))
GO
INSERT [dbo].[Doctor] ([DoctorID], [Name], [Gender], [BirthDate], [PhoneNumber], [Address], [DeptID], [ChargesPerVisit], [PatientsTreated], [Rating], [Qualification], [Specialization], [Work_Experience], [IsActive], [CreatedDate]) VALUES (10, N'Dr. Chetan', N'Male', NULL, N'6789543245', N'Pune', 4, 300, 56, 4, N'MBBS', N'MS - General Surgery', 8, 1, CAST(N'2020-10-04T11:58:22.253' AS DateTime))
GO
INSERT [dbo].[Doctor] ([DoctorID], [Name], [Gender], [BirthDate], [PhoneNumber], [Address], [DeptID], [ChargesPerVisit], [PatientsTreated], [Rating], [Qualification], [Specialization], [Work_Experience], [IsActive], [CreatedDate]) VALUES (11, N'Dr. Neha ', N'Female', NULL, N'8976543456', N'Pune', 5, 400, 12, 5, N'BSC', N'Post Graduation Diploma in Dietetics', 6, 1, CAST(N'2020-10-04T12:00:12.313' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[LoginTable] ON 
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (1, N'password122', N'patient5@gmail.com', 1, CAST(N'2020-10-02T12:06:32.720' AS DateTime))
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (2, N'pass123', N'patient4@gmail.com', 1, CAST(N'2020-10-03T09:39:50.017' AS DateTime))
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (3, N'password12', N'patient3@gmail.com', 1, CAST(N'2020-10-03T10:04:21.587' AS DateTime))
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (4, N'password23', N'patient2@gmail.com', 1, CAST(N'2020-10-03T10:10:25.020' AS DateTime))
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (5, N'password23', N'patient6@gmail.com', 1, CAST(N'2020-10-03T10:20:39.660' AS DateTime))
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (7, N'demo123', N'patient7@gmail.com', 1, CAST(N'2020-10-03T17:31:30.663' AS DateTime))
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (8, N'password8', N'patient8@gmail.com', 1, CAST(N'2020-10-03T17:36:56.297' AS DateTime))
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (9, N'password9', N'patient9@gmail.com', 1, CAST(N'2020-10-03T17:37:53.357' AS DateTime))
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (10, N'password10', N'patient10@gmail.com', 1, CAST(N'2020-10-03T17:40:40.483' AS DateTime))
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (11, N'password11', N'patient11@gmail.com', 1, CAST(N'2020-10-03T17:47:51.280' AS DateTime))
GO
INSERT [dbo].[LoginTable] ([LoginID], [Password], [Email], [Type], [CreatedDate]) VALUES (12, N'password1', N'patient1@gmail.com', 1, CAST(N'2020-10-03T17:59:12.680' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[LoginTable] OFF
GO
INSERT [dbo].[Patient] ([PatientID], [Name], [Phone], [Address], [BirthDate], [Gender], [CreatedDate]) VALUES (2, N'Patient4', N'1234567890', N'pune', CAST(N'2020-10-03' AS Date), N'Female', CAST(N'2020-10-03T09:39:50.020' AS DateTime))
GO
INSERT [dbo].[Patient] ([PatientID], [Name], [Phone], [Address], [BirthDate], [Gender], [CreatedDate]) VALUES (3, N'Patient3', N'9898987878', N'pune', CAST(N'2020-10-03' AS Date), N'Male', CAST(N'2020-10-03T10:04:21.590' AS DateTime))
GO
INSERT [dbo].[Patient] ([PatientID], [Name], [Phone], [Address], [BirthDate], [Gender], [CreatedDate]) VALUES (4, N'Patient2', N'9389675432', N'pune', CAST(N'2020-10-03' AS Date), N'Male', CAST(N'2020-10-03T10:10:25.090' AS DateTime))
GO
INSERT [dbo].[Patient] ([PatientID], [Name], [Phone], [Address], [BirthDate], [Gender], [CreatedDate]) VALUES (5, N'Patient6', N'6745328976', N'pune', CAST(N'2020-10-03' AS Date), N'Male', CAST(N'2020-10-03T10:20:39.690' AS DateTime))
GO
INSERT [dbo].[Patient] ([PatientID], [Name], [Phone], [Address], [BirthDate], [Gender], [CreatedDate]) VALUES (8, N'Patient8', N'8787878787', N'pune', CAST(N'1993-10-03' AS Date), N'Female', CAST(N'2020-10-03T17:36:56.343' AS DateTime))
GO
INSERT [dbo].[Patient] ([PatientID], [Name], [Phone], [Address], [BirthDate], [Gender], [CreatedDate]) VALUES (9, N'Patient9', N'8787009087', N'pune', CAST(N'1978-10-07' AS Date), N'Female', CAST(N'2020-10-03T17:37:53.363' AS DateTime))
GO
INSERT [dbo].[Patient] ([PatientID], [Name], [Phone], [Address], [BirthDate], [Gender], [CreatedDate]) VALUES (10, N'Patient10', N'9898989898', N'pune', NULL, N'Male', CAST(N'2020-10-03T17:40:40.490' AS DateTime))
GO
INSERT [dbo].[Patient] ([PatientID], [Name], [Phone], [Address], [BirthDate], [Gender], [CreatedDate]) VALUES (11, N'Patient11', N'9898999898', N'pune', NULL, N'Female', CAST(N'2020-10-03T17:47:51.317' AS DateTime))
GO
INSERT [dbo].[Patient] ([PatientID], [Name], [Phone], [Address], [BirthDate], [Gender], [CreatedDate]) VALUES (12, N'patient1', N'8787008789', N'pune', NULL, N'Male', CAST(N'2020-10-03T17:59:12.750' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoginTab__A9D10534819E4B6F]    Script Date: 04-10-2020 07:01:06 PM ******/
ALTER TABLE [dbo].[LoginTable] ADD  CONSTRAINT [UQ__LoginTab__A9D10534819E4B6F] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Doctor] ADD  CONSTRAINT [DF_Doctor_PatientsTreated]  DEFAULT ((0)) FOR [PatientsTreated]
GO
ALTER TABLE [dbo].[Doctor] ADD  CONSTRAINT [DF_Doctor_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Doctor] ADD  CONSTRAINT [DF_Doctor_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LoginTable] ADD  CONSTRAINT [DF_LoginTable_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_Patients_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK__Appointme__Patie__7E37BEF6] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK__Appointme__Patie__7E37BEF6]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK__Appointmet_DoctorID] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([DoctorID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK__Appointmet_DoctorID]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Department] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([DeptID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Department]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK__Patients__Gender__70DDC3D8] FOREIGN KEY([PatientID])
REFERENCES [dbo].[LoginTable] ([LoginID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK__Patients__Gender__70DDC3D8]
GO
/****** Object:  StoredProcedure [dbo].[usp_Book_Appointment]    Script Date: 04-10-2020 07:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Book_Appointment] 
@DoctorID int,
@Name varchar(30),
@Phone varchar(12),
@Email varchar(30),
@Date DateTime

AS
BEGIN

	IF NOT EXISTS (select * from LoginTable where Email=@Email)
	BEGIN
		INSERT INTO LoginTable ([Email],[Type]) values (@Email, 1)

		DECLARE @ID int;    
        SELECT @ID = SCOPE_IDENTITY();

		INSERT INTO Patient ([PatientID],[Name],[Phone]) values (@ID, @Name, @Phone)

		INSERT INTO Appointment ([DoctorID],[PatientID],[Date]) values (@DoctorID,@ID,@Date)	    
	END
	
	ELSE
	BEGIN
	    DECLARE @PatientID int;    
        select @PatientID = (select PatientID from Patient where PatientID = (select LoginID from LoginTable where Email=@Email))

		INSERT INTO Appointment ([DoctorID],[PatientID],[Date]) values (@DoctorID,@PatientID,@Date)		
	END

	SELECT 1 AS Result
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Doctor_Details_Read]    Script Date: 04-10-2020 07:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Doctor_Details_Read]
 @doctorid INT
AS
BEGIN    
 SELECT      
 doc.[DoctorID], 
 doc.[Name], 
 doc.[Gender], 
 doc.[BirthDate], 
 doc.[PhoneNumber], 
 doc.[Address], 
 doc.[DeptID], 
 dpt.[DeptName],
 dpt.[Description],
 doc.[ChargesPerVisit],
 doc.[PatientsTreated],
 doc.[Rating], 
 doc.[Qualification],
 doc.[Specialization], 
 doc.[Work_Experience],
 doc.[IsActive],
 doc.[CreatedDate]
FROM Doctor AS doc WITH(NOLOCK)   
INNER JOIN [dbo].[Department] dpt WITH(NOLOCK) 
ON doc.[DeptID] = dpt.[DeptID]
WHERE doc.IsActive = 1 AND doc.DoctorID = @doctorid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Doctor_Details_ReadByID]    Script Date: 04-10-2020 07:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Doctor_Details_ReadByID]
 @doctorid INT
AS
BEGIN    
 SELECT      
 doc.[DoctorID], 
 doc.[Name], 
 doc.[Gender], 
 doc.[BirthDate], 
 doc.[PhoneNumber], 
 doc.[Address], 
 doc.[DeptID], 
 dpt.[DeptName],
 dpt.[Description],
 doc.[ChargesPerVisit],
 doc.[PatientsTreated],
 doc.[Rating], 
 doc.[Qualification],
 doc.[Specialization], 
 doc.[Work_Experience],
 doc.[IsActive],
 doc.[CreatedDate]
FROM Doctor AS doc WITH(NOLOCK)   
INNER JOIN [dbo].[Department] dpt WITH(NOLOCK) 
ON doc.[DeptID] = dpt.[DeptID]
WHERE doc.IsActive = 1 AND doc.DoctorID = @doctorid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Get_Doctor_Details]    Script Date: 04-10-2020 07:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Get_Doctor_Details]   
AS
BEGIN    
 SELECT      
 doc.[DoctorID], 
 doc.[Name], 
 doc.[Gender], 
 doc.[BirthDate], 
 doc.[PhoneNumber], 
 doc.[Address], 
 doc.[DeptID], 
 dpt.[DeptName],
 dpt.[Description],
 doc.[ChargesPerVisit],
 doc.[PatientsTreated],
 doc.[Rating], 
 doc.[Qualification],
 doc.[Specialization], 
 doc.[Work_Experience],
 doc.[IsActive],
 doc.[CreatedDate]
FROM Doctor AS doc WITH(NOLOCK)   
INNER JOIN [dbo].[Department] dpt WITH(NOLOCK) 
ON doc.[DeptID] = dpt.[DeptID]
WHERE doc.IsActive = 1      
END
GO
/****** Object:  StoredProcedure [dbo].[usp_List_Upcoming_Appointments_By_DoctorID]    Script Date: 04-10-2020 07:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_List_Upcoming_Appointments_By_DoctorID] 
@doctorID INT
AS
BEGIN    
SELECT * 
FROM Appointment a WITH(NOLOCK)   
INNER JOIN Patient p WITH(NOLOCK) 
ON a.PatientID = p.PatientID
WHERE DoctorID = @doctorID AND DATEDIFF(DAY, [Date], GETDATE()) = 0
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Login_Credentials]    Script Date: 04-10-2020 07:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Login_Credentials]
@Email varchar(30),
@Password varchar(20),
@Type int 

AS
BEGIN

SET NOCOUNT ON

IF EXISTS(SELECT * FROM LoginTable WHERE [Email] = @Email AND [Password] = @Password AND [Type] = @Type)
    SELECT 1 AS UserExists
ELSE
    SELECT 0 AS UserExists

END


GO
/****** Object:  StoredProcedure [dbo].[usp_Patient_Signup]    Script Date: 04-10-2020 07:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_Patient_Signup]

@Name varchar(30),
@Phone varchar(12),
@Address varchar(50),
@BirthDate Date,
@Gender varchar(6),
@Password varchar(20),
@Email varchar(30)

AS
BEGIN

	IF NOT EXISTS (select * from LoginTable where Email=@Email)
	BEGIN
		INSERT INTO LoginTable ([Password],[Email],[Type]) values (@Password, @Email, 1)

		DECLARE @ID int;    
        SELECT @ID = SCOPE_IDENTITY();

		--select @id = LoginID from LoginTable where Email=@Email

		INSERT INTO Patient ([PatientID],[Name],[Phone],[Address],[BirthDate],[Gender] ) values (@ID, @Name, @Phone, @Address, @BirthDate, @Gender)
	    
		SELECT 1 AS Result
	END
	
	ELSE
	BEGIN
		 SELECT 0 AS Result
	END

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Total_Appointment_By_DoctorID]    Script Date: 04-10-2020 07:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Total_Appointment_By_DoctorID] 
@doctorID INT
AS
BEGIN    
SELECT      
Count(AppointID) 
FROM Appointment WITH(NOLOCK)   
WHERE DoctorID = @doctorID 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Total_Upcoming_Appointment_By_DoctorID]    Script Date: 04-10-2020 07:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Total_Upcoming_Appointment_By_DoctorID] 
@doctorID INT
AS
BEGIN    
SELECT      
Count(AppointID) 
FROM Appointment WITH(NOLOCK)   
WHERE DoctorID = @doctorID AND DATEDIFF(DAY, [Date], GETDATE()) = 0
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Update_Appointments_Status]    Script Date: 04-10-2020 07:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Update_Appointments_Status]  
@appointID INT,
@status bit,
@comment varchar(500)
AS
BEGIN    
Update Appointment set Appointment_Status = @status, DoctorComments = @comment
WHERE AppointID = @appointID
SELECT 1 AS Result
END
GO
ALTER DATABASE [DemoApp] SET  READ_WRITE 
GO
