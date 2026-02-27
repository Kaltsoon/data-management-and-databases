# Case assignment

During this case assignment your team will be designing and implementing a database based on the customer's requirements.

> [!IMPORTANT]
> Case assignment is mandatory to receive a passing grade from the course.

## Required deliverables

### 1. Database design documentation

One `case_assignment_database_design.pdf` PDF document, including:

1. ER diagram.
2. Relational schema.
3. Repository.
4. Database diagram (this will be created in step 2 and then added to the final submission).

### 2. SQL scripts (four `.sql` files)

1. An SQL script to create the database in SQL Server.
2. An SQL script to create the basic set of indexes.
3. An SQL script to populate the database with a reasonable amount of proper data for testing.
4. An SQL script to test the database (this includes 16 SQL statements).

### 3. Project closing report

One `case_assignment_closing_report.pdf` PDF document, including:

1. An evaluation of both the product and the process.
2. Working time records categorized by person and task.

## The development process

The case assignment is carried out in two steps with their own requirements and deadlines.

### Step 1: Database modelling and logical design

> [!IMPORANT]
> Please, record and report the working time, categorized by person(s) and task. You can for example record the working time in a table like this:
> | Team member | Task | Working time |
> | --- | --- | --- |
> | John Doe | Design and implement ER diagram | 3 hours |
> | ... | ... | ... |

#### Conceptual data modelling

1. Create a conceptual model of the database and visualise it as an ER diagram.
2. Write entity type definitions to the repository. Please see the separate repository template in the Moodle's "Case assignment" page.

### Logical database design

1. Derive a relational schema from your ER diagram.
2. Validate the relations with the BCNF rule. Fix the relations if they are not in BCNF.
3. Define integrity constraints for your relations. Document them in the repository .
4. Please submit all step 1 results to Moodle in a single ZIP file. The file should be named as follows:

> [!IMPORTANT]
> Please submit all step 1 results to Moodle's "Case assignment" page in a single ZIP file named `case_assignment_step_1_YOURFAMILYNAME.zip`. **Every team member should do this submission**.

### Step 2: Physical design, implementation in SQL Server, and testing

> [!IMPORANT]
> Please, record and report the working time, categorized by person(s) and task.

#### Physical design and implementation

1. Write an SQL script to create the database structure in SQL Server.
2. Create the database in SQL Server.
3. In SMSS, create a database diagram that shows your tables and relationships etc.
4. Design a minimal set of indexes on your tables and write an SQL script to create them.

> [!NOTE]
> Please note that SQL Server will automatically create unique indexes on primary keys.

#### Testing

> [!IMPORTANT]
> Your test data should look authentic and there should be a reasonable number of rows in each table.

1. Design test data and write an SQL script to insert the test data into the database.
2. Insert the test data into your database.
3. Write an SQL script for all the user transactions listed at the end of this document.
4. Test your implementation by executing the SQL statements
5. Write a short test report.

## Step 3: Evaluate your work

Write a project closing report addressing the following points:

1.  To what extent does the product fulfil the given requirements? Please indicate if any component is missing or if any tests are not functioning properly.
2.  What aspects of the project were successful? What challenges were encountered?
3.  What lessons were learned from this project? What will we do better next time?

> [!IMPORTANT]
> In your report, ensure to include the working time records categorized by person(s) and task.

## Finally, submit all deliverables to Moodle

Please submit all deliverables (step 1 and step 2) to Moodle in a single ZIP file. The file should be named as `case_assignment_final_YOURFAMILYNAME.zip`.

## Greenwood Cultural Association

> [!NOTE]
> This case assignment pertains to a simplified prototype of a real database system. The scope of this assignment has been deliberately narrowed down to include only a minimal set of features. This ensures that the task is manageable and appropriate for our current purposes. In addition, this document is a free-form assignment description. It is not a formal requirements specification.

The teacher represents the customer from the _The Greenwood Cultural Association_. Here's how the customer is describing their requirements:

> _"The Greenwood Cultural Association, a small non-profit organization, hosts a variety of cultural events, including concerts, theatre, dance performances, and more. Traditionally, tickets for these events have been sold in person at the Greenwood tourist office."_
> 
> _"The Association is now looking to modernize its operations by launching a website where clients can view upcoming events and book tickets. Due to budget constraints, a full-scale system is not feasible at this time. Therefore, this case assignment focuses on the initial phase of development."_
>
> _"In this first phase, tickets can be booked online, but online payment is not yet available. Upon booking, clients will receive a unique booking number. Clients must purchase their booked tickets within four days from the booking date at the Greenwood tourist office."_

### Further details

1. The Greenwood Cultural Association currently has three venues for its events. The smallest venue can accommodate 60 people, while the other venues can hold 250 and 600 people. Additional venues may become available in the future.
2. Seats are not assigned or numbered.
3. Ticket numbers are not recorded in the database.
4. All tickets for a specific event are priced equally.
5. To comply with fire safety regulations, overbooking is not permitted.
6. A single event may feature performances from multiple artists.
7. Popular performers frequently visit Greenwood. The Association maintains a registry of artists, including their contact information and specific requests for catering and refreshments.
8. When a client makes a booking, the client's phone number should be registered. No other client details are registered.
9. Booked tickets are identified and purchased using a unique booking number.
10. Each booking can contain tickets for only one event.
11. The number of tickets in a booking can be altered unless the tickets have already been purchased.
12. All tickets within a single booking must be purchased simultaneously.
13. A booking can be cancelled unless it has already been paid for.
14. Once purchased, tickets cannot be changed or refunded unless the event is cancelled.
15. In the event of a cancellation, clients can receive a refund for the purchased tickets, which must be collected in person at the Elliston tourist office.

### Validating the design of the database and testing the database implementation

In this case assignment, you are required to use the user transactions mentioned below to:

- Validate the design of the database
- Test the physical implementation of the database.

> [!NOTE]
> During the design phase, you can use the below as a checklist when you are conducting conceptual data modelling.

Please validate and test your database structure by writing and executing SQL statements for all 16 user transactions mentioned above.

The database prototype should be designed to allow the following operations:

1. Booking tickets.
2. Changing the number of tickets in a booking.
3. Changing ticket booking status to "sold" when tickets are purchased.
4. Cancelling a ticket booking.
5. Removing unpurchased bookings from the database after three days from booking.
6. Cancelling the status of an event to "cancelled" if the event is cancelled.
7. Refunding a client in a case of a cancelled event.

> [!NOTE]
> You are not required to write any procedural code to perform these operations. It is enough that the table structure allows these operations to be performed. 

Examples of the queries the database prototype should support are the following:

1. What is Taylor Swift's contact email?
2. Which artists are scheduled to perform in the Jazz Night event on 30.11.2025?
3. What is the venue name and address for Billie Eilish's concert on 25.3.2026?
4. When is Imagine Dragons' performance in Greenwood, and what are their special requests for catering?
5. What events are coming up this year?
6. What dance performances are coming up this year?
7. How many tickets have been sold so far for The Weeknd's concert scheduled for 5.2.2026?
8. How many tickets remain for Harry Styles' concert on 12.9.2025?
9. How much revenue has the Greenwood Association generated from ticket sales this year?


