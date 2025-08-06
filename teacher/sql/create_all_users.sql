USE BIT_SWD03
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* *****************************************************
* create_all_users.sql 
*
* Koko ryhmän käyttäjätunnusten luominen
*
* Kari Silpiö 5.8.2025 (Kommentoitu versio)
****************************************************** */
CREATE PROCEDURE BIT_SWD03_Create_ALL_Users   -- Tämä luo talletetun proseduurin, joka pitää suorittaa erikseen!
AS                                               

SET NOCOUNT ON                                -- Skriptin aikana ei näytetä ylimääräisiä tulostuksia

DECLARE @database   VARCHAR(50)               -- Muuttujat määritellään ensin erikseen
DECLARE @rolename   VARCHAR(50)
DECLARE @username_prefix VARCHAR(50)
DECLARE @username       VARCHAR(50)
DECLARE @password   VARCHAR(50)
DECLARE @nofUsers   INTEGER
DECLARE @counter    INTEGER

SET @database   = 'BIT_SWD03'     -- Tietokannan nimi
SET @rolename   = 'Student_role'  -- Tämä rooli luodaan eri skriptillä

SET @username_prefix = 'DM_USER_' -- Käyttäjätunnuksen alkuosa johon while-toistossa lisätään loppuosa
SET @password   = 'CHANGE_THIS_123'  -- Pitää olla >= 8 merkkiä joissa kirjain, erikoismerkki ja numero

SET @nofUsers = 50                -- Opiskelijoille luotavien käyttäjätunnusten lukumäärä (Opella _00)

SET @counter = 0
WHILE (@counter <= @nofUsers) 
  BEGIN
    SET @username = @username_prefix + RIGHT('00' + convert(VARCHAR, @counter), 2)
 
	-- 1) Drop user if it exists
	IF EXISTS (SELECT * FROM BIT_SWD03.sys.sysusers WHERE name = @username)     
	    EXECUTE BIT_SWD03.sys.sp_dropuser @username 

	-- 2) Drop login if it exists
	IF EXISTS (SELECT * FROM master.sys.syslogins WHERE name = @username)
	    EXECUTE master.sys.sp_droplogin @username 

	-- 3) Create a new login (username, password, default database)
	   EXECUTE master.sys.sp_addlogin @username, @password, @database

	-- 4) Create a new user for the login (username, loginname)
	   EXECUTE sp_adduser @username, @username
	
	-- 5) Grant the role to the user (rolename, username)
	   EXECUTE sp_addrolemember @rolename, @username    
       
    PRINT @username
    SET @counter = @counter + 1
  END    

GO
