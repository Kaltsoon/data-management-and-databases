# Case assignment

During this case assignment, your team will be designing and implementing a database based on the customer's requirements.

> [!IMPORTANT]
> Case assignment is mandatory to receive a passing grade in the course.

The case assignment is carried out in two steps, with its own requirements and deadlines.

## Step 1: Database modelling and logical design

> [!IMPORTANT]
> Record and report the working time, categorized by person(s) and task throughout the case assignment. You can, for example, record the working time in a table like this:
> | Team member | Task | Working time |
> | --- | --- | --- |
> | John Doe | Design and implement ER diagram | 3 hours |
> | ... | ... | ... |
>
> The working time record will be included in the closing report in step 3.

### Conceptual data modelling

1. Create a conceptual model of the database and visualise it as an ER diagram.
2. Write entity type definitions to the repository. Use the repository template in Moodle's "Case assignment" page.

### Logical database design

1. Derive a relational schema from your ER diagram.
2. Validate the relations with the BCNF rule. Fix the relations if they are not in BCNF.
3. Define integrity constraints for your relations. Document them in the repository.

> [!IMPORTANT]
> Submit all step 1 results to Moodle's "Case assignment" page in a single `case_assignment_database_design.pdf` PDF document. **Every team member should submit this**.

## Step 2: Physical design, implementation in SQL Server, and testing

> [!IMPORTANT]
> It is normal that the database design changes during the development process. If changes are needed, make the necessary updates to the previous step's design documents.

### Physical design and implementation

1. Write an SQL script to create the database structure in SQL Server.
2. Create the database in SQL Server.
3. In SMSS, create a database diagram that shows your tables and relationships, etc.
4. Design a minimal set of indexes on your tables and write an SQL script to create them.

> [!NOTE]
> Please note that SQL Server will automatically create unique indexes on primary keys.

### Testing

> [!IMPORTANT]
> Your test data should look authentic, and there should be a reasonable number of rows in each table.

1. Design test data and write an SQL script to insert the test data into the database.
2. Insert the test data into your database.
3. Write an SQL script for all the 16 operations and queries listed at the end of this material.
4. Test your implementation by executing the SQL statements.
5. Write a short test report.

## Step 3: Evaluate your work

Write a project closing report addressing the following points:

1. To what extent does the product fulfil the given requirements? Please indicate if any component is missing or if any tests are not functioning properly.
2. What aspects of the project were successful? What challenges were encountered?
3. What lessons were learned from this project? What will we do better next time?

> [!IMPORTANT]
> In your closing report, ensure to include the working time records categorized by person(s) and task.

## Finally, submit all deliverables to Moodle

Please submit all deliverables (step 1 and step 2) to Moodle's "Case assignment" page in a single zip file containing the following files:

- `case_assignment_database_design.pdf` containing everything from step 1.
- All the `.sql` files from step 2.
- `case_assignment_database_diagram.pdf` containing the database diagram from step 2.
- `case_assignment_closing_report.pdf` containing the closing report.

The file should be named as `case_assignment_final_YOURFAMILYNAME.zip`. **Every team member should submit this**.

## Requirements from the Greenwood Cultural Association

> [!NOTE]
> This case assignment pertains to a simplified prototype of a real database system. The scope of this assignment has been deliberately narrowed down to include only a minimal set of features. This ensures that the task is manageable and appropriate for our current purposes. In addition, this document is a free-form assignment description. It is not a formal requirements specification.

The teacher represents the customer from the _Greenwood Cultural Association_. Here's how the customer is describing their requirements:

> _"The Greenwood Cultural Association, a small non-profit organization, hosts a variety of cultural events, including concerts, theatre, dance performances, and more. Traditionally, tickets for these events have been sold in person at the Greenwood tourist office._
> 
> _The Association is now looking to modernize its operations by launching a website where clients can view upcoming events and book tickets. Due to budget constraints, a full-scale system is not feasible at this time. Therefore, this case assignment focuses on the initial phase of development._
>
> _In this first phase, tickets can be booked online, but online payment is not yet available. Upon booking, clients will receive a unique booking number. Clients must purchase their booked tickets within four days from the booking date at the Greenwood tourist office."_

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

Validate and test your database structure by writing and executing SQL statements for all 16 operations and queries mentioned below.

> [!NOTE]
> During the design phase, you can use the following as a checklist when you are conducting conceptual data modelling.

The database implementation should be designed to allow the following operations:

1. Booking tickets.
2. Changing the number of tickets in a booking.
3. Changing ticket booking status to "sold" when tickets are purchased.
4. Cancelling a ticket booking.
5. Removing unpurchased bookings from the database after three days from booking.
6. Cancelling the status of an event to "cancelled" if the event is cancelled.
7. Refunding a client in a case of a cancelled event.

> [!NOTE]
> These operations should be performed using e.g. `INSERT INTO` or `UPDATE` statements. You are not required to write any procedural code or triggers perform the operations.

Examples of the queries the database implementation should support are the following:

1. What is Taylor Swift's contact email?
2. Which artists are scheduled to perform in the Jazz Night event on 30.11.2025?
3. What is the venue name and address for Billie Eilish's concert on 25.3.2026?
4. When is Imagine Dragons' performance in Greenwood, and what are their special requests for catering?
5. What events are coming up this year?
6. What dance performances are coming up this year?
7. How many tickets have been sold so far for The Weeknd's concert scheduled for 5.2.2026?
8. How many tickets remain for Harry Styles' concert on 12.9.2025?
9. How much revenue has the Greenwood Association generated from ticket sales this year?


