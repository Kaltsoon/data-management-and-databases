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

- In each hotel, there are rooms of more than one type. The room type can be single, double, suite, etc. The room number is a sequential number starting from 1 and increasing up to the number of the hotel's last room.
- Each booking is for one night only.
- Each booking is for one room only. If two rooms are needed, then two separate bookings are needed.
- When a booking is registered, only one customer name is registered with the booking.
- It is possible that the same customer books in advance for several stays in the same hotel.

For each table, answer the following questions:

1. Are there any _non-atomic_ attributes? If yes, how would you change them to _atomic_?
2. What attribute or combination of attributes would you choose to be primary keys ?
3. Are there any foreign keys? If yes, what are they and what are they used for?

> [!NOTE]
> A _non-atomic_ attribute can decomposed into meaningful components. For example, a `BusStop` relation could have a `coordinates` attribute containing the latitude and longitude coordinates of a bus stop, e.g. `"60.1699, 24.9384"`. The `coordinates` attribute is non-atomic, because we can decompose it into `latitude` and `longitude` components. So, to turn the attribute atomic, we would have atomic `latitude` and `longitude` attributes instead of the non-atomic `coordinates` attribute. Atomic attributes are preferred in the relational model because they make data easier to store, query, update, and maintain.

## Task 4

Study the terms below and describe each of them briefly in your own words:

1. Domain integrity
2. Entity integrity
3. Alternate key
4. Candidate key
5. Composite key
6. Foreign key
7. Natural key
8. Primary key
9. Superkey
10. Surrogate key

> [!IMPORTANT]
> Some of these terms will be asked in the final exam.

## Task 5 

Give examples of two _candidate keys_, one _alternate key_, and one _primary key_. In your examples, use attributes of the following relation schema:

<pre>
Employee (employeeNumber, username, givenName, familyName)
</pre>
