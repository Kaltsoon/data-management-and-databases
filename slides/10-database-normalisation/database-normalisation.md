# Database normalisation

- The learning objectives for this week are:
  - Knowing the purpose of _database normalisation_
  - Knowing what is a _functional dependency_, a _partial dependency_ and a _transitive dependency_
  - Knowing how to identify functional dependencies in a relation or table
  - Knowing the different _normal form_ rules
  - Knowing how to formally check if a relation is in the _Boyce-Codd normal form_ (BCNF)
  - Knowing how to _decompose a relation_ into smaller relations if it is not in BCNF

---

# Database normalisation

- _Database normalisation_ is a formal technique of organizing data in a database in a way that _redundancy_ and _incosistency_ within the data is eliminated
- The objective of database normalisation is to ensure that:
  - Attributes with a _close logical relationship_ (functional dependency) are found in the _same relation_
  - The relations do not display _hidden data redundancy_, which can cause update anomalies that violate database integrity
- The technique involves a set of _normalisation rules_ that are defined as _normal forms_

---

# Redundancy example

Let's consider _redundancy problems_ with the following `Course_Enrolment` relation rows:

| courseno | studentno | phone | enrolment_date |
| -------- | --------- | ----- | -------------- |
| C001     | 10        | 1234  | 2025-04-01     |
| C001     | 20        | 5555  | 2025-04-02     |
| C002     | 30        | 8765  | 2025-04-01     |
| C002     | 40        | 1414  | 2025-04-03     |
| C002     | 10        | 1234  | 2025-04-07     |

---

# Redundancy example

The student `10` _phone number is duplicated_ causing redundancy in the data. While updating a phone number or inserting a new row, there's a risk of having multiple different phone numbers for the same student (inconsistency):

| courseno | studentno | phone  | enrolment_date |
| -------- | --------- | ------ | -------------- |
| C001     | 10        | 1234 ⚠️ | 2025-04-01     |
| ...      | ...       | ...    | ...            |
| C002     | 10        | 3338 ⚠️ | 2025-04-07     |

---

# Database normalisation

- In a case of fixing an identified structural problem, normalisation involves _decomposing a relation into less redundant (and smaller) relations_ without losing information
- When an _ER model is well designed_, the resulting correctly derived relations won't normally have such structural problems and they will meet the criteria of database normalisation
- Normalisation of candidate relations derived from ER diagrams is accomplished by analysing the _functional dependencies_ (FDs) associated with those relations

---

# Functional dependency

- _Functional dependency_ (FD) describes the _relationship between attributes_ in a relation
- With functional dependencies, we are interested in properties of the data that are true for _all the time_
- For example, if the _student number is unique_, the following property is true all the time:
  > The surname for a student whose student number is "a12345" is "Smith"
- So, _all the time_ it is true that there is only one surname for each student
- By contrast, the following property might to be true for a sample set of students, but it is not true for all the time:
  > There is exactly one student whose surname is "Smith"

---

# Functional dependency

- A functional dependency occurs when attribute A in a relation _uniquely determines_ attribute B
- In other words: for each value of A there is _exactly one value_ of B and that _holds all the time_. This can be written as `A → B`
- The _determinant_ of a functional dependency refers to the attribute, or group of attributes, on the _left-hand side_ of the arrow. In `A → B`, A is the determinant of B.
- On the _right-hand side_, there's the _dependent_. In `A → B`, B is the dependent of A.

---

# Example of functional dependency

- Let's suppose that each student has a unique student number. In the relation below, _studentnumber_ uniquely determines _surname_ and _firstname_. That is, _studentnumber is the determinant of surname and firstname_:

    <pre>Student (<u>studentnumber</u>, surname, firstname)</pre>

- In this example, there are the following two functional dependencies:
  - `studentnumber → surname`
  - `studentnumber → firstname`

---

# Example of functional dependency

- Let's suppose the following table occurrence:

  | studentnumber | surname | firstname |
  | ------------- | ------- | --------- |
  | a12345        | Smith   | John      |
  | a14444        | Smith   | Susan     |
  | a15555        | Jones   | Susan     |

- The _functional dependency_ `studentnumber → surname` guarantees that the query below (that uses an existing student number) returns exactly one surname and that holds all the time:

  ```sql
  SELECT surname FROM Student WHERE studentnumber = 'a12345'
  ```

---

# Example of functional dependency

- `{A, B} → C` means that _A and B together uniquely determine C_. For example, `{course_code, implementation_number} → start_date`
- `A → B, C, D` means that _A uniquely determines B, C, and D_, For example, `course_code → course_name, language, credits`

---

# Identifying undesired data redundancy

- Relations that _do not have_ undesired data redundancy, _each determinant is a candidate key_ (an unique attribute that is suitable for being the primary key)
- In such case _all arrows are arrows out of whole candidate keys_ (simple or composite key)
- Let's consider the following relation _without data redundancy_:
    <pre>CourseOffering (<u>coursecode</u>, <u>offeringnumber</u>, startdate, teachernumber)</pre>
- In this relations there's for example the following functional dependency:
  - ✅ `{coursecode, offeringnumber} → startdate, teachernumber`

---

# Identifying undesired data redundancy

- Relations that _have_ undesired data redundancy, _there is a determinant that is not a candidate key_
- In such case _there is on arrow that is not an arrow out of a whole candidate key_
- Let's consider the following relation _with data redundancy_:
    <pre>CourseOffering (<u>coursecode</u>, <u>offeringnumber</u>, coursename,
                  startdate, teachernumber, surname)</pre>

---

# Identifying undesired data redundancy

- In this relations there's for example the following functional depedencies:
  - ✅ `{coursecode, offeringnumber} → coursename, startdate, teachernumber, surname`
  - ❌ `coursecode → coursename`
  - ❌ `teachernumber → surname`
- In functional dependencies `coursecode → coursename` and `teachernumber → surname`, the determinants are not candidate keys
- With such functional dependencies, the relation has redundant data
- For example the teacher's surname is repeated unnecessarily, which can cause consistency issues for example when a teacher's surname is updated
- Instead, the teacher's information should be in a _separate relation_

---

# Calculated attributes

- We _should not include_ attributes in a relation that we can _derive_ from other relations or _calculate_
- For example, let's suppose that the firm's total budget is the total of department budgets
- Therefore, _totalbudget_ is a calculated attribute in the _Firm_ relation
- The value of _totalbudget_ should change whenever any department budget is changed in the firm
- From the data redundancy and integrity viewpoint, we have a problem here because total budget exists twice in the design:

    <pre>
    Firm (<u>firmno</u>, firmname, totalbudget ❌)
    Depertmant (<u>deptno</u>, deptname, deptbudget, firmno)
        FK (firmno) REFERENCES Firm (firmno)</pre>

---

# Calculated attributes

- We shouldn't have the _totalbudget_ attribute in the _Firm_ relation, instead we can calculate it with the following query:
  ```sql
  SELECT SUM(deptbudget) as totalbudget FROM Department
  WHERE firmno = 'a1122'
  ```

---

# Different kind of functional dependencies

- Functional dependencies can be categorized in the following categories:
  - _Non-trivial_ and _trivial_ functional dependencies
  - _Partial_ and _full_ functional dependencies
  - _Transitive_ and _non-transitive_ functional dependencies

---

# Non-trivial and trivial functional dependencies

- `A → B` is _trivial functional dependency_ if B is a subset of A
- `A → B` is _non-trivial functional dependency_ if B is not a subset of A
- Let's consider the _CourseOffering_ relations:
    <pre>CourseOffering (<u>coursecode</u>, <u>offeringno</u>, startdate)</pre>
- In the relation, `{coursecode, offeringno} → startdate` is a _non-trivial functional dependency_, because `startdate` is not a subset of `{coursecode, offeringno}`
- These, on the other are _trivial functional dependencies_ of the relation:
  - `{coursecode, offeringno} → coursecode`
  - `{coursecode, offeringno} → {coursecode, offeringno}`
- In normalisation considerations we are only focusing on _non-trivial functional dependencies_

---

<!--

# Partial and full functional dependencies

- Let's consider the following relation schema:
  <pre>ClubMembership (<u>empno</u>, <u>clubno</u>, clubname, joindate)</pre>
- In this relation the functional dependency `{empno, clubno} → joindate` is a _full functional dependency_, because none of the determinant attributes `empno` or `clubno` determine `joindate` _individually_
- That is, functional dependencies `empno → joindate` or `clubno → joindate` _do not exist_ in the relation
- In constrast, the functional dependency `{empno, clubno} → clubname` is a _partial functional dependency_ because relation `clubno → clubname` _does exist_ in the relation

---

# Transitive and non-transitive functional dependencies

- Let's consider the following relation schema:
  <pre>Employee (<u>empno</u>, surname, firstname, deptno, deptname)</pre>
- In this relations there's functional depdencies `empno → deptno` and `deptno → deptname`
- This means, that `deptname` is _transitively dependent_ on `empno` via `deptno`
- In contrast, `empno → surname` is a _non-transitive dependency_, because `surname` is _not a determinant of any functional dependency_ in the relation

---
-->

# Normal forms

- _Normal form_ refers to a set of normalisation rules that a database relation should follow inorder to be considered "normalized" and thus _well-organized_
- During the course we will cover the most common normal forms: _first normal form_ (1NF), _second normal form_ (2NF), _third normal form_ (3NF) and _Boyce-Codd normal form_ (BCNF)
- Each normal form from 1NF to BNCF adds more rules to the previous normal form
- For example, the 2NF includes all rules of the 1NF and additional rules
- The Boyce-Codd Normal Form (BCNF) is the strictest of these normal forms

---

# First normal form (1NF)

- A relation is in the _first normal form_ (1NF) if the following rules apply:
  - All attributes in a relation _must have atomic values_. No multi-valued attributes are allowed
  - A relation _must have a primary key_ and all its _attributes must be dependent on the primary key_

---

# Second normal form (2NF)

- A relation is in the _second normal form_ (2NF) if the following rules apply:
  - Relation is in 1NF
  - Relation has no _partial functional dependencies_, meaning that there is no _part of a candidate key_ that uniquely determines a _non-candidate-key_ attribute
- Let's consider the following relation:
  <pre>ClubMembership (<u>empno</u>, <u>clubno</u>, clubname, joindate)</pre>
- The relation has a _partial functional dependency_ `{empno, clubno} → clubname`, because the functional dependency `clubno → clubname` exists in the relation
- That is, the relation _is not in 2NF_

---

# Third normal form

- A relation is in the _third normal form_ (3NF) if the following rules apply:
  - Relation is in 1NF
  - Relation has no functional dependency between two _non-candidate-key_ attributes, meaning no _non-candidate-key_ attribute is allowed to be _transitively_ dependent on any _candidate key_ within the relation
- Let's consider the following relation schema:
  <pre>Employee (<u>empno</u>, surname, firstname, deptno, deptname)</pre>
- The relation has functional dependencies `empno → deptno` and `deptno → deptname`, causing `deptname` to be _transitively dependent_ on `empno` via `deptno`
- That is, the relation _is not in 3NF_

---

# Boyce-Codd Normal Form (BCNF)

- We simplify the rules of BCNF we will have the following limitations during the course:
  - We only focusing on _non-trivial functional depdencies_
  - Instead of including any superkeys in our analysis, we narrow the analysis to _candidate keys_
  - We do not allow any attribute that _does not have a determinant_ within the relation
- With these limitations the BCNF has the following rules for a relation:
  - Each determinant is a candidate key
  - All attribute values are atomic (single values)
  - There is a determinant for each attribute that is not contained in a candidate key

---

# Boyce-Codd Normal Form (BCNF)

- Let's consider the following relation:
  <pre>Teacher (<u>teacherno</u>, firstname, surname)</pre>
- `teacherno → firstname, surname` is the only _non-trivial functional depedency_ in the relation
- ✅ Each determinant is a candidate key
- ✅ All attribute values are atomic (single values)
- ✅ There is a determinant for each attribute that is not contained in a candidate key
- Thus, _the relation is in BCNF_

---

# Boyce-Codd Normal Form (BCNF)

- Let's consider the following relation:
  <pre>CourseGrade (<u>course_code</u>, <u>studentno</u>, firstname, surname, grade)</pre>
- `studentno → firstname, surname` is one of the _non-trivial functional depedencies_ in the relation
- ❌ `studentno` is _not a candidate key_ in the relation (so each determinant is _not_ a candidate key)
- Thus, _the relation is not in BCNF_

---

# Turning a relation into Boyce-Codd Normal Form

- To convert a _non-BCNF relation to BCNF_, we must decompose the relation in two steps
- Step 1: Find a _non-trivial functional dependency_ `X → Y` which violates the BCNF rule (find a determinant that is _not a candidate key_)
- Step 2: Split the original relation in two relations as follows:
  - Create a new relation with all attributes (for example both X and Y) from the dependency. X will be the primary key in the new relation
  - Remove Y attribute(s) from the original relation and leave X in the original relation to act as a foreign key.
- We repeat the steps above until all of our relations are in BCNF

---

# Turning a relation into Boyce-Codd Normal Form

- Let's consider the following relation candidate:
  <pre>CourseOffering (<u>coursecode</u>, <u>offeringno</u>, 
                  coursename, startdate, teacherno,  surname, firstname)</pre>
- In the first step, we identify the _non-trivial functional dependencies_:
  - `{coursecode, offeringno} → coursename, startdate, teacherno, surname, firstname`
  - `coursecode → coursename`
  - `teacherno → surname, firstname`
- Then, we identify functional dependencies where the determinant is _not a candidate key_
- There's two such cases: `coursecode → coursename` and `teacherno → surname, firstname`

---

# Turning a relation into Boyce-Codd Normal Form

- In the second step, to solve these two cases we split the original relation two times
- With `coursecode → coursename` we create a new relation Course with attributes `coursecode` and `coursename`
- The determinant, the `coursecode` will be the primary key for the relation. We'll get the following relation:
  <pre>Course (<u>coursecode</u>, coursename)</pre>
- Finally, we remove the `coursename` from the CourseOffering relation and leave `coursecode` as a foreign key:
  <pre>CourseOffering (<u>coursecode</u>, <u>offeringno</u>, 
                  startdate, teacherno,  surname, firstname)
    FK (coursecode) REFERENCES Course(coursecode)
  </pre>

---

# Turning a relation into Boyce-Codd Normal Form

- We will repeat the same process with `teacherno → surname, firstname` and the final relations are the following:
  <pre>
  Course (<u>coursecode</u>, coursename)
  Teacher (<u>teacherno</u>, surname, firstname)
  CourseOffering (<u>coursecode</u>, <u>offeringno</u>, startdate, teacherno)
    FK (coursecode) REFERENCES Course(coursecode)
    FK (teacherno) REFERENCES Teacher(teacherno)
  </pre>
- Finally, we _check the decomposed relations_
- In each relation above each determinant is a candidate key and each attribute non-candidate-key attribute has a determinant
- Therefore, the _relations are in BCNF_ and we have successfully removed all the undesired redundancy from the design

---

# Summary

- _Database normalisation_ is a formal technique of organizing data in a database in a way that _redundancy_ and _incosistency_ within the data is eliminated
- We analyze a set _normalisation rules_ to determine if a relation is in a certain _normal form_ (1NF, 2NF, 3NF, BCNF)
- Normalisation rules determine what kind _functional dependencies_ the relation can have
- We can turn a non-BCNF relation into BCNF relations by decomposing the relation
