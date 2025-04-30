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
  )
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

- In this case, the second statement would never be executed, meaning that the money is deposited to one account but never withdrawed from the other one
- What we would have wanted is that either _both of the statements succeed_ or _in case of a failure the database is restored to its previous state_
- This behavior can be achieved with _database transactions_
- A database transaction is a _unit of work_ that is performed on a database
- All operations within the unit of work are _either completed successfully_ or the _transaction is aborted at the point of failure_ and all the previous operations are rolled back to their former state

---

## Purpose of database transactions

- Database transactions have two main purposes:
  1. To provide reliable units of work that allow _correct recovery_ from failures and keep a database consistent even in cases of system failure. The previous example is an example of such case
  2. To provide _isolation between programs_ accessing a database concurrently. For example two programs that read and update the same rows at the same time might end up in a situation where the updates aren't applied correctly

---

# Business, user and database transactions

- From the end user's point of view, for processing a _business transaction_ one or more use cases can be defined for the application and implemented as _user transactions_
- A single user transaction may involve multiple _database transactions_ (SQL transactions)
- A database transaction commonly involves _multiple database operations_, such as retrieving, creating or updating data in the database

---

# The autocommit mode

- In the autocommit mode each individual SQL statement submitted for execution is treated as a _single transaction_
- If a statement _completes successfully_, it is _committed_
- If a statement _encounters any error_, it is _rolled back_
- That is, no changes can be rolled back after the statement has been successfully executed
- This is the default transaction management mode in SQL Server, MariaDB, and PostgreSQL

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
  - `ROLLBACK`: terminates the transaction and _restores the database to the previous state_, undoing all operations in the transaction

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
- Let's revisit the bank transfer example, but this time we will have the two `UPDATE` statements _inside a transaction_:

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
- Instead, a transaction begins _implicitly_ with the first executable SQL statement after the database connection is opened or after the previous transaction is terminated

---

# Concurrency control

- To fulfil the business requirements the DBMS should protect database consistency _without sacrificing too much performance_
- In a multi-user environment the DBMS has to _interleave the actions of several transactions_ but still preserve illusion that each user is executing alone
- The _concurrency control_ mechanism is responsible to provide the means to guarantee that a transaction is isolated from the effects of concurrently scheduling other transactions

---

# Concurrently control

- The programmer is responsible of informing the DBMS about the desired _level of isolation_
- If a transaction both reads and writes data, the _isolation level_ of the transaction should usually be set as below to avoid anomalies caused by concurrent updates:

  ```sql
  SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
  ```

- The isolation level (e.g. `REPEATABLE READ`) limits how other transactions can access shared data, e.g. update a row that other transaction is reading

---

# Locking

- Data consistency and isolation with transactions is achieved by the _locking mechanism_
- When our transaction changes (`INSERT`, `UPDATE`, `DELETE`) a row in a database, the DBMS _locks the row_
- Other concurrent transactions _are not allowed to change the row_ as long as the transaction is running
- That is, the other transactions that want to change the row _must wait_ until the transaction ends

---

# Locking

- If we start your transaction as follows:

  ```sql
  SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
  BEGIN TRANSACTION
  -- ...
  ```

- The DBMS allows other concurrent transactions to read (`SELECT`) a row that your transaction has already read, but it _prevents the other transactions to change the row as long as your transaction is running_

---

# Locking

- For example, if _user A_ starts a transaction which _reads_ a row in the `Account` table:

  ```sql
  SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
  BEGIN TRANSACTION
  -- 🔒 this will lock the row from changes
  SELECT balance FROM Account WHERE account_id = 1
  ```

- Then, _user B_ starts a transaction which _updates_ the locked row in the `Account` table:

  ```sql
  SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
  BEGIN TRANSACTION
  -- ⏲️ the row is locked, the transaction has to wait until the user A's transaction ends
  UPDATE Account SET balance = 6000 WHERE account_id = 1;
  ```

- The transaction of user B has to wait until the user A transaction ends (`COMMIT` or `ROLLBACK`)

---

# Locking

- Locking resolves concurrency conflicts by _blocking a transaction_ (like in the previous example) or _forcing a transaction to abort_
- When transaction is blocked it has to wait for the resource. The default for the maximum waiting time is "forever"
- When two transactions start to _permanently block each other_, the DBMS _forces either one transaction to abort_ (rollback). This allows the other transaction to continue normally
- A _deadlock_ occurs when two (or more) transactions permanently block each other by each transaction having a lock on a resource which the other transaction is trying to lock

---

<div style="display: grid; grid-template-columns: repeat(2, 1fr); grid-gap: 0px 16px;">
<div>

```sql
BEGIN TRANSACTION
UPDATE Account
SET balance = balance - 100
WHERE account_id = 1 -- 🔒 locking account 1
```

</div>

<div>
</div>

<div>
</div>
<div>

```sql
BEGIN TRANSACTION
UPDATE Account
SET balance = balance - 50
WHERE account_id = 2 -- 🔒 locking account 2
```

</div>

<div>

```sql
UPDATE Account
SET balance = balance - 50
-- ⏲️ trying to lock account 2,
-- must wait for transaction B
WHERE account_id = 2
```

</div>
<div>
</div>

<div>
</div>
<div>

```sql
UPDATE Account
SET balance = balance - 100
-- ⏲️ trying to lock account 1,
-- must wait for transaction A
WHERE account_id = 1
```

</div>

</div>

---

# Example of a deadlock

- The following things happen in the example:
  1. Transaction A locks account 1 and updates it
  2. Transaction B locks account 2 and updates it
  3. Transaction A is trying to lock account 2 (must wait, B has already locked the row)
  4. Transaction B is trying to lock account 1 (must wait, A has already locked the row)
- Transaction B cannot continue until transaction A completes, but transaction A is blocked by transaction B. This cycle is a deadlock

---

# Example of a deadlock

- Both transactions in the deadlock will wait unless the deadlock is broken by the DBMS
- When the DBMS detects a deadlock it chooses one of the transactions as a victim and terminates it (rollback) with an error message
- This allows the other transaction to continue normally
- Locks protect our data but _decrease concurrency_. Even without a deadlock a transaction can make others wait for a long time

---

# Row-level locking in SQL Server

- When a user has a lock on a row, the lock _prevents other users from modifying or even reading that row_
- The behavior depends on the _lock type_
- The basic lock types are _write lock_ and _read lock_
- In SQL Server, to avoid a certain type of deadlock, _"intent to update" lock_ is also available

---

# Write lock

- If transaction T1 wants to _modify a row_ (update, delete, insert), then it has to acquire a _write lock_ on the row

  ```sql
  BEGIN TRANSACTION
  -- 🔒 acquire write lock for account 1
  UPDATE Account SET balance = 6000 WHERE account_id = 1;
  ```

- ⚠️ T1 has to wait until _the row is free from all other locks_ before acquiring the lock
- When T1 has a write lock on the row, all other transactions that want to access (select or modify) the row have to wait until T1 ends
- A write lock is _never released before the transaction ends_

---

# Read lock

- If transaction T1 wants to _select a row_, then it has to acquire a _read lock_ on the row

   ```sql
  BEGIN TRANSACTION
  -- 🔒 acquire read lock for account 1
  SELECT balance FROM Account WHERE account_id = 1;
  ```

- ⚠️ If another transaction has a _write lock_ on the row, then T1 has to wait until the other transaction ends
- If there is no write lock on the row, then T1 gets a read lock on the row
- If the transaction isolation level is set to `READ COMMITTED` (the default), then the read lock is _released immediately after the row is retrieved from the database_
- If the transaction isolation level is set to `REPEATABLE READ` or `SERIALIZABLE`, then the read lock _is not released before the transaction ends_

---


# "Intent to update" lock

- In SQL Server, you can use the non-standard `(UPDLOCK)` locking hint that prevents a certain form of deadlocks that occur when two transactions are first reading the same row and and then updating the row:

  ```sql
  SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
  BEGIN TRANSACTION
  -- 🔒 acquire "intent to update" lock for account 1
  SELECT balance FROM Account (UPDLOCK) WHERE account_id = 1
  ```

- The DBMS allows only one transaction at time to _read the same row_ with the `(UPDLOCK)` locking hint
- If another transaction tries to read the same row with the `(UPDLOCK)` locking hint, it has to wait until the first transaction ends

---

# Summary of lock types

| Statement                          | Acquired lock type      | Allowed locks on the same row                                  |
| ---------------------------------- | ----------------------- | -------------------------------------------------------------- |
| `UPDATE`, `DELETE`, `INSERT`       | Write lock              | _None_                                                         |
| `SELECT`                           | Read lock               | Any number of _read locks_ and a _"intent to update" lock_     |
| `SELECT` with the `(UPDLOCK)` hint | "Intent to update" lock | Any number of _read locks_ (but _no "intent to update" locks_) |

---

# Summary

- _Database transactions_ provide a way to perform multiple database operations in single independent unit of work which either succeeds or fails as a whole
- Database transactions ensure that the database properly changes states upon a successfully committed transaction
- Changes of failed database transactions are rolled back by the DBMS
- The _concurrency control_ mechanism is responsible to provide the means to guarantee that a transaction is isolated from the effects of concurrently scheduling other transactions
- In _lock-based concurrency control_ transactions _lock database rows_ while reading and modifying a row
- Other transactions that want to access the lock row _must wait_ until the transaction ends
