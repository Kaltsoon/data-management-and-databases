# Relational Model Exercises 2

> [!IMPORTANT]
> Write your answers to a Word document named `relational_model_2_YOURFAMILYNAME.docx` and submit the document to Moodle. Submissions can be found on Moodle's "Coursework submissions" page.

## Task 1

Who was Edgar Frank Codd and what did he have to do with relational databases?

## Task 2

Describe the constraint called _referential integrity_. What is the purpose of this constraint? Why is it desirable to enforce referential integrity?

## Task 3

Below you have the relational database schema for the hotel booking database:

<pre>
Hotel (hotelNumber, hotelName, city)
Room (roomNumber, hotelNumber, roomType, price)
Booking (hotelNumber, roomNumber, customerNumber, startDate)
Customer (customerNumber, customerName, homeAddress, phone, email)
</pre>

Here's how the hotel booking should work:

- In each hotel, there are rooms of more than one type. The room type can be single, double, suite, etc.
- Each booking is for one night only.
- Each booking is for one room only. If two rooms are needed, then two separate bookings are needed.
- When a booking is registered, only one customer name is registered with the booking.
- It is possible that the same customer books in advance for several stays in the same hotel.

For each table, answer the following questions:

1. Are there any non-atomic attributes? If yes, how would you change them to atomic?
2. What attribute or combination of attributes would you choose to be primary keys ?
2. Are there any foreign keys? If yes, what are they and what are they used for?

## Task 4

Study the terms below and describe each of them shortly in your own words:

1. Domain integrity
2. Entity integrity
3. Alternate key
4. Candidate key
5. Composite key
6. Compound key
7. Foreign key
8. Natural key
9. Primary key
10. Superkey
11. Surrogate key

> [!IMPORTANT]
> Some of these terms will be asked in the final exam.

## Task 5 

Give examples of two _candidate keys_, one _alternate key_, and one _primary key_. In your examples, use attributes of the following relation schema:

<pre>
Employee (employeeNumber, loginName, givenName, familyName)
</pre>