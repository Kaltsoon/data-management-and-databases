# Database design

- The learning objectives for this week are:
  - Knowing what database development lifecycle is and from which phases it consists of
  - Knowing what conceptual database design is?
  - Knowing what is entity-relationship modeling
  - Knowing how to implement entity-relationship diagrams

---

# Database development lifecycle

- So far we have explored and written SQL queries for existing databases, such as the Takkula database
- We have been able to successfully retrieve all kinds of relevant information from the database
- What we might not have thought is that _why_ the Takkula database structured as it is
  - Why does it have these specific tables and columns?
  - Why does it have these relationships between tables?
- The end result is an output of the _database development lifecycle_

---

# Database development lifecycle

- The _database development lifecycle_ is a step-by-step process of implementing a database for certain set of requirements
- It consists of the following phases:
  1. Database planning
  2. System definition
  3. Requirements collection and analysis
  4. Database design
  5. Database implementation
  6. Data conversion and loading
  7. Testing
  8. Operational maintenance

---

# Database design

- Once the users' requirements are identified after the _requirements collection and analysis phase_, the _database design_ phase can start
- _Database design_ is a the process of creating a design that will meet the _data requirements_ of the enterprise and support the enterprise's
  operations
- For example, this is could be one data requirement in the Takkula database:
  - "University has courses. Each course has multiple course instances which are taught during a certain time period. Each course instance has a teacher"

---

# Database design

- A common approach in database design, is the _top-down_ approach
- We start from the "top", with the development of high-level conceptual data model with few high-level entity types (for example "Course", "Course instance" and "Teacher")
- Then we move down to the "bottom" by adding details step-by-step until we have developed the physical data model with all the tables, columns and other details about the database schema
- The typical main phases in a systematic top-down database design process are:
  1. Conceptual database design
  2. Logical database design
  3. Physical database design

---

# Conceptual database design

- During the _conceptual database design_ phase, a high-level conceptual model of the data requirements of the enterprise is constructed
- The model represents the entities and their relationships
- The model is _independent of all physical considerations_, for example how the data is actually organized into database tables
- The end result is a _conceptual database schema_

---

# Example of conceptual database schema

Here's an example of the conceptual database schema for a hotel booking database:

![width:900px](./conceptual.png)

---

# Conceptual database design

- The objective of conceptual database design is:
  - To assist in understanding the meaning (semantics) of the data
  - To facilitate communication about the data requirements
  - To understand the requirements (_what_ should be done), well enough before moving to any technical considerations (_how_ to do it)

---

# Logical database design

- During the _logical database design_ phase, the conceptual schema is translated into a logical database structure based on a specific data model (for example the Relational Model)
- The model represents details about the entities, such as relations, attributes, primary and foreign key contraints and other type of constraints
- The model is _independent of a particular DBMS product_ and other physical considerations
- The end result is a _logical database schema_

---

# Example of logical database schema

Here's an example of the logical database schema for a hotel booking database:

![width:600px](./logical.png)

---

# Physical database design

- During the _physical database design_ phase, a description of the physical implementation of the database is produced
- The model describes the implemention using a particular DBMS product
- The model includes tables, columns, column types and all other DBMS specific details
- The end result is a _physical database schema_

---

# Example of physical database schema

Here's an example of the physical database schema for a hotel booking database:

![width:700px](./physical.png)

---

# User views

- Different database users have a different requirements for the database
- A _user view_ defines what is required of a database system from the perspective of a particular job role (such as manager or supervisor) or enterprise application area (such as marketing or human resources)
- Each user view defines from its own perspective _what data is held in the database_ and _what the user will do with the data_ (user transactions)
- We need to able to manage _multiple user views_ during the design process
- There is three main approaches to solve this problem: the _centralised_, the _user view integration_ and the _combined approach_

---

# Managing multiple user views

- With the _centralised approach_, we first merge requirements for all user views into a
  _single set of requirements_ and then create a _single data model_ that represents all
  user views
- With the _user view integration approach_, we first create _a separate data model_ for each user view and then merge these data models into a _single data model_
- With the _combined approach_, we first, merge _some user
  views_ and then continue with _user view integration approach_
- Out of these three approaches, the user view integration approach is preferred when the system is more complex and there are significant differences between user views
