# Database transactions

- The learning objectives for this week are:
  - Knowing what a _database transaction is_ and _why it has a crucial role in reliable software systems_
  - Knowing the difference between _business transaction_, _user transaction_ and _database transaction_
  - Knowing what a _SQL transaction is_ and _what are the SQL statements that the
    programmer needs to use to control SQL transactions_
  - Knowing what is meant by _concurrency control_
  - Knowing what a _deadlock is_ and how to _demonstrate it_

---

# Introduction to database transactions

- Let's imagine that we are responsible for designing database that needs to store bank account balances
- The design should support a basic user transaction of transfering money between two accounts. That is, withdrawing money from one account and depositing it to another
- We come up with the following `Account` table to match the requirements:

  ```sql
  CREATE TABLE Account (
      account_id INTEGER NOT NULL IDENTITY,
      balance INTEGER NOT NULL,

      CONSTRAINT PK_Account PRIMARY KEY (account_id)
  ),
  ```

---

# Introduction to database transactions

- Then we consider the user transaction of transfering money between two accounts. We think that we can handle it with just two separete `UPDATE` statements:

  ```sql
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  UPDATE account SET balance = balance - 100 WHERE account_id = 1
  ```

- The DBMS will execute these two statements separately one-by-one. Assuming that _both_ of these statements are executed successfully the transfer is successful
- But what if there's a failure (for example system failure or disk crash) in the DBMS and the second statement is never executed:

  ```sql
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  -- 💥 There's a failure in the DBMS
  ```

---

# Introduction to database transactions

- In this case, the second statement would never be executed, meaning that the money is deposited to one account but never withdrawed to the other one
- What we would have wanted is that either _both of the statements succeed_ or _in case of a failure the database is restored to its previous state_
- This behavior can be achieved with _database transactions_
- A database transaction is a unit or sequence of work that is performed on a database
- All operations within the work unit are completed successfully. Otherwise, the transaction is aborted at the point of failure and all the previous operations are rolled back to their former state

---

# Business, user and database transactions

- From the end user's point of view, for processing a _business transaction_ one or more use cases can be defined for the application and implemented as _user transactions_
- A single user transaction may involve multiple _database transactions_ (SQL transactions)
- A database transaction involves multiple database operations, such as retrieving, creating or updating data in the database

---

# The autocommit mode

- In the autocommit mode each individual SQL statement submitted for execution is treated as a _single transaction_
- If a statement _completes successfully_, it is _committed_
- If a statement _encounters any error_, it is _rolled back_
- That is, no changes can be rolled back after the statement has been successfully
  executed
- This is the default transaction management mode in SQL Server, MariaDB, and
  PostgreSQL

```sql
INSERT INTO Account (balance) VALUES (0) -- automatically committed
UPDATE Account SET balance = 100 WHERE account_id = 1 -- automatically committed
```

---

# The autocommit mode

- Let's see what's the consistency problem mentioned in the previous bank account example. Let's assume that the total balance of the bank is 900 euros:

  | account_id | balance |
  | ---------- | ------- |
  | 1          | 300     |
  | 2          | 600     |

- Now, if we start to execute a bank transfer (in the autocommit mode) to transfer _100 euros_ from _account 1_ to _account 2_:

  ```sql
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  -- 💥 There's a failure in the DBMS
  ```

- Unfortunately, due to a system failure the second update is not executed

---

# The autocommit mode

- That is, we end up with a situation where the database is _not in a consistent state_ any more
- Now the total balance retrieved from the database is 1000 euros, even though it should be 900 euros:

  | account_id | balance |
  | ---------- | ------- |
  | 1          | 300     |
  | 2          | 700     |

---

# Database transactions

- Transactions have four standard properties, usually referred to by the acronym _ACID_
- _Atomicity_ ensures that all operations within the work unit are completed successfully. Otherwise, the transaction is aborted at the point of failure and all the previous operations are rolled back to their former state
- _Consistency_ ensures that the database properly changes states upon a successfully committed transaction
- _Isolation_ enables transactions to operate independently of and transparent to each other
- _Durability_ ensures that the result or effect of a committed transaction persists in case of a system failure

---

# SQL transactions

- When the application logic needs to execute a sequence of SQL statements in an atomic fashion, then the statements need to be grouped as a logical unit of work called _SQL transaction_
- The following SQL statements can be used for starting and ending SQL transactions:
  - `BEGIN TRANSACTION`: starts a new transaction (explicit transaction start in SQL Server)
  - `COMMIT`: terminates the transaction and _make all changes permanent_
  - `ROLLBACK`: terminates the transaction and _rolls back all changes_ (restores the database to the previous state)

---

# SQL transactions

- In the bank transfer example we could have the following transaction:

  ```sql
  BEGIN TRANSACTION -- start a new transaction
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  UPDATE account SET balance = balance - 100 WHERE account_id = 1
  COMMIT -- make all changes permanent
  ```

- ⚠️ Nothing will happen until we either `COMMIT` or `ROLLBACK` the transaction
- From the programmer's viewpoint, the advantage of the rollback statement is that it _undoes all database changes made during the current transaction_
- That is, there is no need for executing any of reverse operations to cancel the already completed insert, delete, and update operations

---

# SQL transactions

- The `COMMIT` statement _can fail_, whereas the `ROLLBACK` statement _cannot ever fail_
- If a program crash or any system failure occurs before a transaction commits, the DBMS automatically rolls back all the changes made by the transaction
- Let's revisit the bank transfer example, but this time we will have the `UPDATE` statements _inside a transaction_:

  ```sql
  BEGIN TRANSACTION
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  UPDATE account SET balance = balance - 100 WHERE account_id = 1
  COMMIT
  ```

---

# SQL transactions

- Initially, the total balance of the bank is 900 euros:

  | account_id | balance |
  | ---------- | ------- |
  | 1          | 300     |
  | 2          | 600     |

- Now, if we execute a bank transfer in an _SQL transaction_ to transfer _100 euros_ from _account 1_ to _account 2_:

  ```sql
  BEGIN TRANSACTION
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  -- 💥 Failure
  ```

---

# SQL transactions

- Due to the failure the second `UPDATE` and the `COMMIT` statement are not executed
- If the client application failed or if the client computer went down or was restarted, this also broke the database connection. The _DBMS rolls back the transaction_ when the network notifies it of the break
- If the failure was on the DBMS side then the _DBMS automatically rolls back all uncommitted transactions_ when it goes through the standard recovery process when it is restarting

---

# SQL transactions

- That is, we always end up with a situation where the database is in a _consistent state_
- The DBMS has automatically _undone the first update_ and the total balance retrieved from the database is 900:

  | account_id | balance |
  | ---------- | ------- |
  | 1          | 300     |
  | 2          | 600     |

---

# Transaction modes

- _Transaction mode_ determines how transactions are started. By default, transactions are managed at the database connection level
- A database connection operates either in _explicit transactions mode_ or _implicit transactions mode_
- In the _explicit transactions mode_, a transaction must be started explicitly by executing the `BEGIN TRANSACTION` statement
- The explicit transactions mode is the default mode in SQL Server
- In the _implicit transactions mode_, transactions are _not_ started explicitly by executing the `BEGIN TRANSACTION` statement
- Instead, a transaction begins _implicitly_ with the first executable SQL statement after the database connection is
  opened or after the previous transaction is terminated

---

# Concurrency control

---