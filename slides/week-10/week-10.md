# Database normalisation

- The learning objectives for this week are:
  - Knowing what the purpose of database normalisation
  - Knowing what is a functional dependency, a partial dependency and a transitive dependency
  - Knowing how to identify functional dependencies in a relation or table
  - Knowing the different normal form rules
  - Knowing how to formally check if a relation is in the Boyce-Codd normal form (BCNF)
  - Knowing how to decompose a relation into smaller relations if it is not in BCNF

---

# Database normalisation

- _Database normalisation_ is a formal technique of organizing data in a database in a way that _redundancy_ and _incosistency_ within the data is eliminated
- The objective of database normalisation is to ensure that:
  - Attributes with a _close logical relationship_ (functional dependency) are found in the _same relation_
  - The relations do not display _hidden data redundancy_, which can cause update anomalies that violate database integrity
- The technique involves a set of normalisation rules that are defined as _normal forms_ (1NF, 2NF, 3NF, BCDF...)

---

# Database normalisation

- In a case of fixing an identified structural problem, normalisation involves _decomposing a relation into less redundant (and smaller) relations_ without losing information
- When an _ER model is well designed_, the resulting correctly derived relations won't normally have such structural problems and they will meet the criteria of database normalisation
- Normalisation of candidate relations derived from ER diagrams is accomplished by analysing the _functional dependencies_ (FDs) associated with those relations

---

# Functional depedency

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

- By contrast, the query below may return several student numbers:

  ```sql
  SELECT studentnumber FROM Student WHERE surname = 'Smith'
  ```

- The latter type of dependency is called _multi-valued dependency_ and it can be written as follows: `surname –>> studentnumber`

---

# Identifying undesired data redundancy

- Relations that _do not have_ undesired data redundancy ✅, _each determinant is a candidate key_ (an unique attribute that is suitable for being the primary key)
- In such case _all arrows are arrows out of whole candidate keys_ (simple or composite key)
- Let's consider the following relation _without data redundancy_:
    <pre>CourseOffering (<u>coursecode</u>, <u>offeringnumber</u>, startdate, teachernumber)</pre>
- In this relations there's for example the following functional depedency:
  - ✅ `{coursecode, offeringnumber} → startdate, teachernumber`

---

# Identifying undesired data redundancy

- Relations that _have_ undesired data redundancy ❌, _there is a determinant that is not a candidate key_
- In such case _there is on arrow that is not an arrow out of a whole candidate key_
- Let's consider the following relation _with data redundancy_:
    <pre>CourseOffering (
        <u>coursecode</u>,
        <u>offeringnumber</u>,
        coursename,
        startdate,
        teachernumber,
        surname
    )</pre>

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
- In normalisation considerations we are only focusing on non-trivial functional dependencies

---

# Partial and full functional dependencies

---

# Transitive and non-transitive functional dependencies

---