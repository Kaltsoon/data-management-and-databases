# Physical Design Exercises

> [!IMPORTANT]
> Submit the following two SQL scripts to Moodle:
>
> - `physical_design_tables_YOURFAMILYNAME.sql`
> - `physical_design_indexes_YOURFAMILYNAME.sql`

The objective of this exercise is to familiarise yourself with the basics of database table and index creation and have hands-on practising in creating tables and indexes. Refer to this week's lesson slides and the "SQL Create Table Syntax" task as materials.

![Image](./assets/physical-design-app-preview.png)

# The task

1. Create tables with integrity constraints based on the data dictionary descriptions in this paper
2. Create the basic set of indexes for all tables (do not worry about the small number of rows)

- NB! SQL Server automatically creates some indexes. View the indexes on each table to see that you have not created any redundant indexes!

3. Insert some rows into each table.
4. Verify that your integrity constraints are ok (by trying to enter some invalid data)
5. Create a database diagram on the Randonneur database tables. Name it as 'RDB_diagram'.

Write the following two SQL scripts:

- DM_Randonneur_Create\_ FamilyName_FamilyName .sql for creating tables and inserting data

- DM_Randonneur_Indexes\_ FamilyName_FamilyName .sql for creating indexes

## Optional extra studying:

- (1) Write a query that displays a list of riders who have finished a certain brevet.
- (2) Create the Randonneur database tables in MariaDB. Submit the new scripts, too.

## Entity type descriptions

| ENTITY TYPE      | Description                                              | Synonyms, Aliases                                      | Occurrence                                                                                                            | Min Medium Max | Volatility per year |
| ---------------- | -------------------------------------------------------- | ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- | -------------- | ------------------- |
| Brevet           | A non-competitive long-distance cycling event            | event, ride, sportive, randonnee                       | Every year ca. 20-30 brevets are organised.                                                                           | 60 n/a 1000    | + 20-30             |
| Rider            | A cyclist whose hobby is randonneuring                   | randonneur, cyclist                                    | New riders emerge all the year round. Possibly 20-30 new riders each year.                                            | 200 400 2000   | + 10-30             |
| Club             | A cycling club or team.                                  | cycling club, team, randonneur club                    | HH Randonneurs add new clubs from time to time and update the information, but only very rarely delete the old ones   | 20 40 100      | + 1-3               |
| User credentials | Credentials that can be used to establish user identity. | identification credentials, authentication credentials | User credentials will be created for each rider. In addition, user credentials will be created for each administrator | 220 400 2000   | + 10-40             |

## Relationship type descriptions

| RELATIONSHIP TYPE   | Description                   | Synonyms, Aliases | Occurrence                                          | Min Medium Max | Volatility per year |
| ------------------- | ----------------------------- | ----------------- | --------------------------------------------------- | -------------- | ------------------- |
| Brevet registration | A rider signs up for a brevet | brevet sign up    | Typically, there are 5-50 sign ups per each brevet. | n/a n/a 10000  | + 400-500           |
| Brevet completion   | A rider finishes a brevet     | diploma           | Typically, there are 5-50 finishers per each brevet | n/a n/a 10000  | + 400-500           |

## Relations

| Relation name | Brevet                                                             | Brevet  | Brevet     | Brevet      | Brevet                         | Brevet      |
| ------------- | ------------------------------------------------------------------ | ------- | ---------- | ----------- | ------------------------------ | ----------- |
| Attribute     | Description                                                        | Type    | Requi- red | Key         | Special domain                 | CHECK in DB |
| brevetId      | Surrogate key: Unique brevet identifier                            | Integer | Yes        | PRIMARY KEY | -                              | -           |
| distance      | The distance in kilometres to be cycled when completing the brevet | Integer | Yes        | -           | 200, 300, 400, 600, 1000, 1200 | Yes         |
| brevetDate    | The date when the brevet takes place                               | Date    | Yes        | -           | -                              | -           |
| brevetTime    | The time when the brevet starts                                    | Time    | Yes        | -           | -                              | -           |
| location      | The location where the brevet starts                               | Text    | Yes        | -           | -                              | -           |
| climbing      | The total (in meters) to be climbed when completing the brevet.    | Integer | Yes        | -           | 0 - 99999                      | Yes         |

| Relation name | Brevet_Rider                                                          | Brevet_Rider | Brevet_Rider | Brevet_Rider                           | Brevet_Rider             | Brevet_Rider |
| ------------- | --------------------------------------------------------------------- | ------------ | ------------ | -------------------------------------- | ------------------------ | ------------ |
| Attribute     | Description                                                           | Data type    | Requi- red   | Key                                    | Special domain           | CHECK in DB  |
| riderId       | Unique rider identifier                                               | Integer      | Yes          | IN PRIMARY KEY FOREIGN KEY 1 => Rider  | -                        | -            |
| brevetId      | Unique brevet identifier                                              | Integer      | Yes          | IN PRIMARY KEY FOREIGN KEY 2 => Brevet | -                        | -            |
| isCompleted   | Brevet completion status 'N' = registered only 'Y' = brevet completed | Text         | Yes          | -                                      | 'N', 'Y'                 | Yes          |
| finishingTime | The rider's finishing time                                            | Text         | Yes          | -                                      | Valid time format: hh:mm | -            |

| Relation name | Club                                  | Club      | Club       | Club          | Club           | Club        |
| ------------- | ------------------------------------- | --------- | ---------- | ------------- | -------------- | ----------- |
| Attribute     | Description                           | Data type | Requi- red | Key           | Special domain | CHECK in DB |
| clubId        | Surrogate key: Unique club identifier | Integer   | Yes        | PRIMARY KEY   | -              | -           |
| clubName      | The name of the club                  | Text      | Yes        | ALTERNATE KEY | -              | -           |
| city          | The home place of the club            | Text      | Yes        | -             | -              | -           |

| email | The club's contact email | Text | Yes | -   | -   | -   |
| ----- | ------------------------ | ---- | --- | --- | --- | --- |

| Relation name | Rider                                            | Rider     | Rider      | Rider         | Rider           | Rider       |
| ------------- | ------------------------------------------------ | --------- | ---------- | ------------- | --------------- | ----------- |
| Attribute     | Description                                      | Data type | Requi- red | Key           | Special domain  | CHECK in DB |
| riderId       | Surrogate key: Unique rider identifier           | Integer   | Yes        | PRIMARY KEY   | -               | -           |
| familyName    | Family name                                      | Text      | Yes        | -             | -               | -           |
| givenName     | Given name                                       | Text      | Yes        | -             | -               | -           |
| gender        | Gender                                           | Text      | Yes        | -             | 'F', 'M'        | Yes         |
| phone         | Phone                                            | Text      | -          | -             | -               | -           |
| email         | Email                                            | Text      | -          | -             | -               | -           |
| clubId        | Club identifier                                  | Integer   | Yes        | FOREIGN KEY   | -               | -           |
| username      | Username                                         | Text      | Yes        | ALTERNATE KEY | -               | -           |
| password      | Password                                         | Text      | Yes        | -             | -               | -           |
| role          | The authorisation role for the user's privileges | Text      | Yes        | -             | 'user', 'admin' | Yes         |

Database diagram (logical schema)

![Image](DM_Physical_Design_Exercises_artifacts\image_000001_6c6dc8b2834314c86cb3a1f920f0de8627fe954f5e75e7820e9a6adae3b6e5f2.png)
