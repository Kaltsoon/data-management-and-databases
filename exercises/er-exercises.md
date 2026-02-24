# ER Exercises

> [!IMPORTANT]
> Write your answers to a Word document named `er_exercises_YOURFAMILYNAME.docx` and submit the document to Moodle. Include ER diagrams as images in the document.

The objective of this exercise is to familiarize yourself with the basics of conceptual modeling, have some hands-on practicing in data modeling, and learn to create simple ER diagrams based on a closed small set of requirements. Refer to this week's lesson slides and the ER refresher task as materials.

## Drawing ER diagrams

You can freely choose how to draw the ER diagrams for the tasks. Here are a few suggestions:

- The fastest way to do simple drawings is by pencil and paper (you probably need an eraser, too). Then you can take a picture of your drawing and insert it into the Word document.
- Using the [Draw.io](https://app.diagrams.net/#Uhttps%3A%2F%2Fraw.githubusercontent.com%2FKaltsoon%2Fdata-management-and-databases%2Frefs%2Fheads%2Fmain%2Fmisc%2Fer-diagram-template.drawio#%7B%22pageId%22%3A%22QuxI1ohhswkWBOuuOeb1%22%7D) online tool. You can draw all the ER diagrams in a single diagram file and take a screenshot of each diagram for the submission.

## General instructions

1. Do not add any additional features or details to your design.
2. Make sure that you do not include any redundancy in the model, e.g., redundant attributes or relationship types.
3. Determine multiplicity constraints (e.g., `1..*`).
4. If the _minimum number_ of occurrences is not clear from the text or the context (and the teacher is not available for any clarification), you can specify zero as the minimum.
5. If the _maximum number_ of occurrences is not clear from the text or the context (and the teacher is not available for any clarification), you can use your own judgement to select a sensible maximum.

## Task 1: Warm-up by interpreting an ER diagram

Suppose we are organising one-day boat cruises. We have one boat, and there are plenty of part-time sailors available. The conceptual model is visualised as the ER diagram below.

![Image](./assets/er-1-task-1.png)

First, read the following carefully:

- In the diagram, `{ XOR }` means "eXclusive OR" and it is used for modeling the following business rule: "A sailor can be only in a single role in the same crew".
- "Captain", "engineer", and "crew member" are role names.
- Unique identifiers are underlined.

Are the statements below true or false? _Give arguments!_

1. There can be a crew of 10 sailors.
2. The minimum size of a crew is one.
3. "John Smith" (snn: "123") cannot be a captain in two different crews.
4. There can be a crew of 6 sailors that consists of the captain and 5 crew members.
5. There can be a sailor who has not joined any crew yet.
6. "John Smith" (snn: "123") can be a member of two different crews that sail on 20.3.2016.

## Task 2: More warm-up with multiplicity constraints

Determine multiplicity constraints for the relationship types below. Mark the constraints (min..max) to the diagrams.

![Image](./assets/er-1-task-2-1.png)

![Image](./assets/er-1-task-2-2.png)

## Task 3: Clubs

> _"A company organizes a lot of activities for its employees. There are many clubs (tennis club, cycling club, theatre club, etc.) in the company. Each employee may join any club, but they are not allowed to belong to more than one club."_

The company wants to have a database for registering club memberships. Based on the data in the database, it should be possible to answer the following types of questions:

- What clubs are there?
- Who are the members of a certain club (e.g., tennis club)?

Summarize the data requirements in an ER diagram. That is, create an ER diagram based on the case description above.

Instructions:

- Read the description above very carefully.
- Do not add any additional features or details to your design.
- Use the notation used in this week's lesson slides in your diagram.
- This time, do not include any attributes in your diagram.
- If there exists a single entity occurrence that seems to be logically related to the other entity occurrences, but there are no data requirements on that entity occurrence, you do not have to include the entity type in the diagram.

> [!TIP]
> - Common nouns (e.g., "Customer", "Guide", or "Tour") in the text are potential entity types.
> - Verbs in the text are potential relationship types.
> - There can be any number of relationship types between the same two entity types. For example, a footballer can be both a captain and a player in a team.

## Task 4: Company

Create an ER diagram that captures all the information below. This time, no attributes.

> _"In a company, there is a division that operates many departments. Each department employs many people. Each employee is employed by exactly one department. Each department has a manager. The manager of the department is always one of the employees who are employed by the department. In addition, there are many projects. Each employee may work in many projects. Each project has many project members."_

## Task 5: Orchestras

Create an ER diagram that captures all the information below. This time, no attributes.

> _"There are many orchestras. Each musician belongs to exactly one orchestra. There are many music competitions organized every year. Musicians may participate in several music competitions yearly. The musician who performs the best in a music competition wins the particular competition. Each competition is organized by exactly one orchestra. Each orchestra has a leader. The orchestra leader is always a musician who is a member of the orchestra."_

## Task 6: Simple library

Create an ER diagram that captures all the given information. Identify all entity types, attributes, and relationship types. Underline the unique identifier (if any exists). Do not add any attributes that cannot be derived directly from the given text.

> _"In the university library, there is a single copy of every recommended course textbook. All students are allowed to borrow textbooks. The loan period is two days. Textbooks out on loan can be reserved."_

Examples of important user transactions include the following:

- List of textbooks (name, author, ISBN).
- List of overdue loans (due date, textbook name, student number, student name, email).
- List of reservations for a certain textbook (textbook name, reservation date and time, student number, student name, email).

## Task 7: Bicycle manufacturing

Create an ER diagram that captures all the given information. Identify all entity types, attributes, and relationship types. Underline the unique identifier (if any exists). Do not add any attributes that cannot be derived directly from the given text.

> _"A company manufactures many models of road racing bicycles. Each bicycle model is characterized by a model name and frame size. Each model is made up of many parts, and each part may be used in the manufacture of more than one model. Each part has a unique part number and a description. Each bicycle model is manufactured at just one of the company's factories, which are located in Helsinki, Turku, and Tampere - one factory in each city. Each factory manufactures many types of parts. Each type of part is manufactured at one factory only."_

## Task 8: Record company

Create an ER diagram that captures all the given information. Identify all entity types, attributes, and relationship types. Underline the unique identifier (if any exists). Do not add any attributes that cannot be derived directly from the given text.

> _"A record company has decided to store information about musicians who perform on its albums. Each track on an album is performed by one or more musicians, and a musician may perform on a number of tracks. Each track is composed by one or more musicians. No track can appear on more than one album. Each album is produced by a musician."_

Examples of important user transactions include the following:

- List of musicians (ssn, name, email). ssn = social security number.
- Top 10 list of musicians who have been performing on the biggest number of albums.
- List of producers (ssn, name, email, number of albums produced).
- List of albums (album title, producer, date when released, number of tracks).
- List of tracks on an album  (track name, track length, names of musicians who perform on the track).

---

> [!IMPORTANT]
> The remaining tasks are optional.

## ⭐ Bonus task 9: Thesis

Create an ER diagram that captures all the given information. Identify all entity types, attributes, and relationship types. Underline the unique identifier (if any exists). Do not add any attributes that cannot be derived directly from the given text.

> _"In the university, each student should complete one thesis (thesis project). Each thesis is supervised by one teacher and evaluated by another teacher. Some teachers might have supervised and/or evaluated these even 50 or more times, whereas some new teachers haven't supervised/evaluated any thesis yet. The thesis gets its final grade in an evaluation meeting where there are usually many theses evaluated. Though it could be so that no BIT theses have been completed for a certain evaluation meeting, and thus none were evaluated there. To be able to run an evaluation meeting, at least one teacher who acts as the chair of the evaluation meeting and two other teachers should be present in the meeting."_

Examples of important user transactions include the following queries:

- Does a certain student have a thesis (thesis project) already or not yet?
- Who is the supervisor of a certain student's thesis?
- Has a thesis evaluator for a certain thesis been assigned already?
- When have the evaluation meetings been held?
- Who was present as a member when a certain student's thesis was evaluated?
- Who was present as the chair when a certain student's thesis was evaluated?
- Which theses were evaluated in a certain meeting?

Here is Mr. John Doe. He has been involved with many thesis-related activities as follows:

- Supervisor of five theses.
- Evaluator of seven theses.
- Attended as a member of ten thesis evaluation meetings.
- Acted as a chair in two thesis evaluation meetings.

## ⭐ Bonus task 10: Dentistry

Create an ER diagram that captures all the given information. Identify all entity types, attributes, and relationship types. Underline the unique identifier (if any exists). Do not add any attributes that cannot be derived directly from the given text.

> _"A dentistry maintains dentist/patient appointment data. A patient is given an appointment at a specific date and time with a dentist located at a particular reception room. On each day of patient appointments, a dentist is allocated to a specific reception room for that day. A dentist can work in different reception rooms on different days. A patient can have an appointment with any dentist. Each patient has a personal dentist who is responsible for sending the patient invitations for regular dental check-ups."_

Examples of important user transactions include the following queries:

- List of patients (patient number, name).
- List of reception rooms that are booked for a given date (room number, dentist number, dentist name).
