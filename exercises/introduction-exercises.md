# Introduction Exercises

> [!IMPORTANT]
> Write your answers to a Word document named `introduction_exercises_YOURFAMILYNAME.docx` and submit the document to Moodle. Submissions can be found on Moodle's "Coursework submissions" page.

## Task 1: Advantages of DBMSs

Suppose that you were asked to give a presentation on advantages of DBMSs. Data storage and data retrieval and update operations are the basic functions of DBMS. If you were limited presenting only 3 functions from the remaining functions of a DBMS, which functions would you choose and why?

## Task 2: Important concepts

Study this week's lessons slides and describe each of the following terms briefly in your own words:

1. Data
2. Metadata
3. Data Management
4. Database Management System (DBMS)
5. Database
6. Data redundancy (in the database)
7. Data independence (in the context of databases)

> [!IMPORTANT]
> Some of these terms may be asked in the final exam.

## Task 3: Primary and foreign keys

> [!TIP]
> Revisit the previous "Orientation exercises" assignment to recap the purpose of primary and foreign keys.

Suppose the following tables exist in the database.

The `Band` table:

| band no | band name          | leader no |
| ------- | ------------------ | --------- |
| 3       | The Rolling Stones | 103       |
| 1       | The Beatles        | 101       |
| 2       | Queen              | 102       |

The `Musician` table:

| musician no | given name | family name | band no |
| ----------- | ---------- | ----------- | ------- |
| 101         | John       | Lennon      | 1       |
| 102         | Freddie    | Mercury     | 2       |
| 103         | Mick       | Jagger      | 3       |
| 104         | Paul       | McCartney   | 1       |
| 105         | Brian      | May         | 2       |
| 106         | Keith      | Richards    | 3       |
| 107         | George     | Harrison    | 1       |
| 108         | Ringo      | Starr       | 1       |
| 109         | George     | Martin      | 1       |
| 110         | Roger      | Taylor      | 2       |
| 111         | John       | Deacon      | 2       |

### Questions

1. Who are the members of the band "The Beatles"?
2. Who is the leader of the band "Queen"?
3. Determine the primary key for each table.
4. Determine all foreign keys (there are two foreign keys). Also, mention the name of the referenced table.
5. Consider the tables above. Can a musician belong to more than one band? _Give arguments!_

> [!TIP]
> Consider, for example adding a row `101, John, Lennon, 2` to put "John Lennon" to the "Queen" band. Would this be problematic?

## Task 4

Suppose the following tables exist in the database.

The `Band` table:

| band no | band name        | leader no |
| ------- | ---------------- | --------- |
| 2       | Deep Purple      | 102       |
| 1       | AC/DC            | 101       |
| 3       | Steve Morse Band | 103       |

The `Musician` table:

| musician no | given name | family name |
| ----------- | ---------- | ----------- |
| 101         | Angus      | Young       |
| 102         | Ian        | Gillan      |
| 103         | Steve      | Morse       |
| 104         | Brian      | Johnson     |
| 105         | Roger      | Glover      |
| 106         | Van        | Romaine     |
| 107         | Malcolm    | Young       |
| 108         | Jon        | Lord        |
| 109         | Dave       | LaRue       |
| 110         | Phil       | Rudd        |

The `Band_Musician` table:

| band no | musician no |
| ------- | ----------- |
| 1       | 101         |
| 1       | 104         |
| 1       | 107         |
| 2       | 102         |
| 2       | 103         |
| 2       | 105         |
| 2       | 110         |
| 2       | 108         |
| 3       | 103         |
| 3       | 106         |
| 3       | 109         |

### Questions

1. Who are the members of the band "AC/DC"?
2. Who are the members of the band "Steve Morse Band"?
3. Determine the primary key for each table.
4. Determine all foreign keys (there are three foreign keys). Also, mention the name of the referenced table.
5. Consider the tables above. Can a musician belong to more than one band? _Give arguments!_
