# SQL access control exercises

> [!IMPORTANT]
> Please submit this exercise as a `access_control_exercises_YOURFAMILYNAME.sql` file to Moodle. If pair work, then both students submit the file with two family names in the file name.

The objective of this exercise is to familiarize yourself with the basics of SQL access control with database users, database roles and privileges. Use this week's lesson slides as materials.

## Instructions

It is highly recommended that you complete these tasks with another student as pairwork in the following way:

1. Choose a student to work with. Both students should connect to the Haaga-Helia's SQL Server with their computers by following the [Using Haaga-Helia's SQL Server](../materials/sql-server/haaga-helia-sql-server.md) guide.
2. Follow the instructions in the tasks, where you will give another student rights to access your table. The other student then accesses your table from their computer.

_Alternatively_, you can do complete the tasks alone, _if you have installed SQL Server on your own computer_. Then you'll do the following:

1. Connect to the SQL Server on your own computer (like you have done in the exercise before) in SQL Server Management Studio.
2. Create a new SQL Server login name and username in your database. Then, grant the `CONNECT` privilege to the new username. You can do these steps by executing the following statements:

   ```sql
   -- feel free to change login name or password
   CREATE LOGIN visitor WITH PASSWORD = 'SECRET_password_12345'
   CREATE USER visitor FROM LOGIN visitor
   GRANT CONNECT TO visitor
   ```

3. Open a new connection to your SQL Server instance by clicking "Connect" in the "Object Explorer" panel on the left and choose "Database Engine". Choose the "Authentication" option as "SQL Server Authentication" and login using the username and password of the user you just created. Use this connection to execute the queries of the "other student" mentioned in the tasks.

> [!IMPORTANT]
> In this alternative way of compliting the tasks, you need to use the two connections: one for executing your queries and other for executing the "other student's" queries.

## Task 1

> [!TIP]
> This week's lesson slides have useful examples for SQL access control.

1. Create a new table as below (replace '...' with a table name of your own choice).

    ```sql
    CREATE TABLE ...
    (
      id INTEGER NOT NULL,
      data VARCHAR(50) NOT NULL,
      CONSTRAINT pk PRIMARY KEY(id)
    )
    ```

2. Insert a couple of rows into your table.
3. Give the `SELECT` privilege on your table to another student.
4. Tell the other student your username and the name of your table.
    - Ask the other student to try to select all rows from your table.
    - See that the other student can select the rows successfully.
5. Revoke the `SELECT` privilege from the other student.
6. Finally, ask the other student to try to select all rows from your table (the select operation should not succeed anymore). 

## Task 2

> [!IMPORTANT]
> If you are working alone in your own SQL Server environment, then you can use the role name `friends`.

1. Create a new database role called `friends_of_XX`. IMPORTANT: replace `XX` with last two digits from your Haaga-Helia's SQL Server username. For example, if your SQL Server username is `DM_USER_99`, the role name is `friends_of_99`.
2. Give the `SELECT` and `INSERT` privileges on your table to the role `friends_of_XX`. The table is the table that you created in the previous task.
3. Add the other student as a member to the role `friends_of_XX`.
4. Ask the other student to try to select all rows from your table.
    - See that they can select the rows successfully.
5. Ask the other student to insert a couple of rows into your table.
    - See that they can insert the rows successfully.
6. List all rows from your table.
    - You should now see the rows that the other student inserted.
7. Revoke the `INSERT` privilege from the role `friends_of_XX`
8. Test the current privileges of the role `friends_of_XX` by asking the other student to do the following:
    - Select all rows from your table.
    - Insert a new row into your table.
9. Remove all members from the role `friends_of_XX`.
10. Delete the role `friends_of_XX`.

> [!IMPORTANT]
> You should both manage the access of the other student and try accessing the other student's table. So, both students should complete each step.
