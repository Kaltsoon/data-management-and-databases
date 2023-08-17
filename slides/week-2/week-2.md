# The relational model

---

# Data Model

![bg fit right:50%](./data-model.png)

- A _data model_ is representation of _data elements_ and the relationships between them based on real-world objects
  - For example when modeling a simple online store, data element representing customer is related to a data element representing an order
- Data elements document real-world which means that the data model represents reality

---

# Components of a data model

- A data model consists of three components:
  1. _Structural part_: a set of rules according to which databases can be constructed
  2. _Integrity part_: a set of integrity constraints to ensure database integrity
  3. _Manipulative part_: a set of operations that are allowed on the data

---

# The relational model

- When all data model's data is logically structured within _relations_, the model is a _relational model_
- These relations are informally referred to as _tables_
- The data is perceived by the users as tables
- Relation has named _attributes_ (informally called _columns_)
- Attributes have a set of allowable values, which is referred to as the attribute's _domain_
  - For example "person" relation's "age" attribute could be an integer value larger or equal to zero
- The actual data is in relations's _tuples_ (informally called _rows_)

---

![](./relation-terminology.png)

---

# Properties of relations

- Each relation has a name that is distinct from all other relation names
- Each attribute has a distinct name
- Each tuple's cell contains exactly one value
- Values of an attribute are all from the same domain
- The order of attributes has no significance
- There are no duplicate tuples
- The order of tuples has no significance

---

# Integrity constraints

- The quality of the data directly determines the quality of the whole database
- Therefore preventing entry of incorrect data is one of the most important functions of a DBMS
- _Integrity constraints_ are rules used to control the legal database states
- If the database satisfies all the integrity constraints specified on the database schema, it is in a legal state

---

# Domain integrity

- A _domain constraint_ specifies the set of allowable values for a column
  - For example valid grade marks are integers between 0 and 5
- Domain constraints enforce _domain integrity_

---

# Entity Integrity

- A _superkey_ is an attribute or group of attributes that uniquely identifies each tuple of a relation
- Relation can have multiple superkeys
  - In the "course" relation the "code" attribute, and group of "code" and "name" attributes are superkeys
  - What other superkeys does the "course" relation have?

![](./relation.png)

---

# Entity Integrity

- A _candidate key_ is a superkey that satisfies the property of _minimality_
    - Minimality is satisfied if an attribute can't be removed from the group of attributes without breaking the uniqueness property
    - In the "course" relation the group of "code" and "name" attributes doesn't satify minimality, so it isn't a candidate key
    - What other candidate keys does the "course" relation have?
- From the set of candidate keys for the relation, _exactly one_ candidate key is chosen to be the _primary key_
- The other candidate keys become _alternate keys_
- Each tuple has a value for the primary key, it can't be missing
- _Primary key constraint_ prevents duplicate tuples to exist for the relation
- Primary key constraints enforce _entity integrity_

---

# Referential Integrity

- _Foregin key_ is a attribute or group attributes whose values are required to match those of the primary key of the referenced relation
- There can be several foreign keys in a relation
- Foreign-to-primary-key matching is the "glue" which holds the database together
- _Foreign key constraint_ prevents foreign key not being matched by a primary key in the referenced relation
- Foreign key constraints enforce _referential integrity_

---

![](./relation-reference.png)

---

# Not null constraint

- _Null_ is a marker for a missing attribute value
- Null is not the same as e.g. blanks or zero. Null represents absence of a value
- The _not null constraint_ is a restriction placed on an attribute
- It enforces the condition that, in that attribute, every tuple of data must contain a value

---

# Database manipulation



---

# Summary

- A _data model_ consists of three components: the _structural part_, the _integrity part_ and the _manipulative part_
- In the _relational model_, all data is logically structured within relations that have attributes and tuples
- _Integrity constraints_ are rules which make sure that the database is in a legal state
- _Domain constraint_ specifies the set of allowable values for an attribute
- _Primary key constraint_ prevents duplicate tuples to exist for the relation
- _Foreign key constraint_ prevents foreign key not being matched by a primary key in the referenced relation