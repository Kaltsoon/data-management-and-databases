
USE BIT_SWD03
GO

CREATE PROCEDURE BIT_SWD03_Create_Role  -- Huom. tämä luo talletetun proseduurin, joka pitää suorittaa erikseen!
AS

/* *****************************************************
* create_student_role.sql    Opiskelijaroolin luominen
*
* Kari Silpiö     5.8.2025 kommentoitu versio
****************************************************** */

CREATE ROLE Student_Role

GRANT CREATE TABLE TO Student_Role WITH GRANT OPTION
GRANT CREATE VIEW  TO Student_Role WITH GRANT OPTION

GRANT CREATE ROLE  TO Student_Role

GRANT CREATE PROCEDURE,CREATE FUNCTION TO Student_Role

GRANT SHOWPLAN TO Student_Role    -- Execution planin katsomisoikeus

-- HUOM. Database Diagram -oikeutta ei voi antaa tätä kautta
-- DBA:n on ensin itse käytävä luomassa uusi Database Diagram. 
-- Vasta tämän jälkeen käyttäjät voivat luoda Database Diagrameja.
GO
