# Initialize the Takkula Database Exercise

The Takkula tables construct a database of university-related data, with tables such as `Course`, `Teacher` and `Student`. These tables will be used in the SQL exercises during the course. Follow carefully the instructions below to create the tables and data for testing.

## Task 1: Download the Takkula database scripts

In this week's "Exercises" section on the Moodle's "Course outline" page, click on the "Takkula scripts (create, insert, drop)" link. The link takes you to the following script files:

| File                      | Description                                                                                                                                                               |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TAKKULA_Create_Tables.sql` | `CREATE` statements to create the tables                                                                                                                                    |
| `TAKKULA_Insert_Data.sql`   | `INSERT` statements to insert the test data into the tables                                                                                                                 |
| `TAKKULA_Drop_Tables.sql`   | `DROP` statements to drop the database tables. If something goes wrong, you can drop Takkula tables by executing this script and then you can create the tables again. |

Download the script files as folder by clicking the "Download folder" button.

## Task 2: Creating the tables

1. Open SQL Server Management Studio. Then, open `TAKKULA_Create_Tables.sql` the file into a query window by navigating to "File" > "Open" > "File". Make sure that the target database is selected as "BIT_SWD03" in the dropdown menu next to the "Execute" button! 
2. Execute the whole file (without highlighting anything) by cliking the "Execute" button.
3. Refresh the "BIT_SWD03" database's tables [as described here](../materials/sql-server/sql-server-management-studio.md#exploring-the-database-structure) and see if you have 11 new tables.
4. Finally, close the query window.

## Task 3: Inserting the data

1. Open `TAKKULA_Create_Tables.sql` the file into a query window by navigating to "File" > "Open" > "File". Make sure that the target database is selected as "BIT_SWD03" in the dropdown menu next to the "Execute" button! 
2. Execute the whole file (without highlighting anything) by cliking the "Execute" button.
3. Open a new query window and make sure that there is data in the tables. For example, display the contents of the following tables: `Teacher`, `Student`, and `CourseGrade` by executing three separate `SELECT` statements one by one. 
4. Finally, close all query windows.

Now everything is ready for you to move on to the SQL Exercise 1.
