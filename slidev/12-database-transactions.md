---
colorSchema: light
fonts:
  sans: Roboto
  weights: "200,400,600,700"
---

## Database transactions

- The learning objectives for this week are:
  - Knowing what a **database transaction is** and **why it has a crucial role in reliable software systems**
  - Knowing what a **SQL transaction is** and **what are the SQL statements** that the database developer needs to use to control SQL transactions
  - Knowing what is meant by **concurrency control**
  - Knowing what a **deadlock is** and how to **demonstrate it**
  - Knowing the purpose of transaction **isolation levels**

<div class="footnote">

_A substantial portion of these materials is derived from the work of Kari Silpiö. Any use, reproduction, or distribution of this content requires prior written permission from him._

</div>

---

## Bank transfer example

- Let's imagine that we are responsible for designing a database that needs to store bank account balances
- The design should support a basic use case of transferring money between two accounts. That is, withdrawing money from one account and depositing it to another
- We come up with the following `Account` table to match the requirements:

  ```sql
  CREATE TABLE Account (
      account_id INTEGER NOT NULL IDENTITY,
      balance INTEGER NOT NULL,

      CONSTRAINT PK_Account PRIMARY KEY (account_id)
  )
  ```

---

## Risk of separate updates

- Then we consider the required database operations for transferring money between two accounts. We think that we can handle it with just two separate `UPDATE` statements:

  ```sql
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  UPDATE account SET balance = balance - 100 WHERE account_id = 1
  ```

- The DBMS will execute these two statements separately one-by-one. Assuming that **both** of these statements are executed successfully the transfer is successful
- But what if there's a failure (for example system failure or disk crash) in the DBMS and the second statement is never executed:

  ```sql
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  -- 💥 There's a failure in the DBMS
  ```

---

## Transactions as units of work

- In this case, the second statement would never be executed, meaning that the money is deposited to one account but never withdrawn from the other one
- What we would have wanted is that either **both of the statements succeed** or **in case of a failure the database is restored to its previous state**
- This behavior can be achieved with a **database transaction**, which is a unit of work that is performed on a database consisting of multiple database operations
- All operations within the unit of work are **either completed successfully** or the **transaction is aborted at the point of failure** and all the previous operations are rolled back to their former state

---

## Purpose of database transactions

- Database transactions serve two main purposes:
  - **Reliable recovery from failures**: transactions provide reliable units of work that ensure the database remains consistent, even if a system failure occurs during an operation. The previous example illustrates this purpose
  - **Isolation between concurrent users**: transactions prevent concurrent operations from interfering with each other. For example, they help prevent two users from simultaneously updating the same row and accidentally overwriting each other's changes

---

## The autocommit mode

- By default, each SQL statement is executed as a **separate transaction**
- If a statement **completes successfully**, its changes are automatically **committed** to the database
- If a statement **encounters an error**, its changes are **rolled back** (undone)
- Once a statement has been successfully committed, its changes cannot be undone
- This behavior is called **autocommit mode** and is the default transaction management mode in SQL Server, and PostgreSQL

```sql
INSERT INTO Account (balance) VALUES (0) -- automatically committed
UPDATE Account SET balance = 100 WHERE account_id = 1 -- automatically committed
```

---

## Partial commit after a failure

- Let's see what's the consistency problem mentioned in the previous bank account example. The initial total balance of the bank is 900 euros:

  | account_id | balance |
  | ---------- | ------- |
  | 1          | 300     |
  | 2          | 600     |

- If we transfer 100 euros from account 1 to account 2 using two `UPDATE` statements and the DBMS fails to execute the latter statement, there's no way to rollback to the previous state

  ```sql
  UPDATE account SET balance = balance + 100 WHERE account_id = 2 -- committed
  -- 💥 There's a failure in the DBMS and the latter statement won't be executed
  UPDATE account SET balance = balance - 100 WHERE account_id = 1 -- never committed
  ```

---

## Inconsistent total balance

- We end up with a situation where the database is **not in a consistent state** any more and the bank's total balance is 1000 euros, even though it should be 900 euros:

  | account_id | balance                            |
  | ---------- | ---------------------------------- |
  | 1          | 300                                |
  | 2          | <span v-mark.circle.red>700</span> |

- Using a database transaction, we can group these operations into a single unit of work, ensuring that either both updates are successfully committed or neither update takes effect if an error occurs

---

## ACID properties

- Transactions have four standard properties, usually referred to by the acronym **ACID**
- **Atomicity**: all operations in the transaction either complete successfully or none of them take effect. If an operation fails, the transaction is aborted and all previous operations are rolled back to their original state
- **Consistency**: a transaction moves the database from one valid state to another. When it commits, all of its operations (e.g. multiple updates) are applied, and all integrity constraints still hold
- **Isolation**: concurrently running transactions operate independently of each other, so one transaction does not see the uncommitted changes of another
- **Durability**: once a transaction is committed, its changes persist even if the system fails afterwards

---

## SQL transaction statements

- When the application logic needs to execute a sequence of SQL statements in an atomic fashion, then the statements need to be grouped as a logical unit of work called **SQL transaction**
- The following SQL statements can be used for starting and ending SQL transactions:
  - `BEGIN TRANSACTION`: starts a new transaction (explicit transaction start in SQL Server)
  - `COMMIT`: terminates the transaction and **makes all changes permanent**
  - `ROLLBACK`: terminates the transaction and **restores the database to the previous state**, undoing all operations in the transaction

---

## Bank transfer as a transaction

- In the bank transfer example we could have the following transaction:

  ```sql
  BEGIN TRANSACTION -- start a new transaction
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  UPDATE account SET balance = balance - 100 WHERE account_id = 1
  COMMIT -- make all changes permanent
  ```

- ⚠️ Nothing will happen until we either `COMMIT` or `ROLLBACK` the transaction
- From the software developer's viewpoint, the advantage of the rollback statement is that it **undoes all database changes made during the current transaction**
- That is, there is no need for executing any of reverse operations to cancel the already completed insert, delete, and update operations

---

## Rollback and commit failures

- The `COMMIT` statement **can fail**, whereas the `ROLLBACK` statement **cannot ever fail**
- If an application crash or any system failure occurs before a transaction commits, the DBMS automatically rolls back all the changes made by the transaction
- Let's revisit the bank transfer example, but this time we will have the two `UPDATE` statements **inside a transaction**:

  ```sql
  BEGIN TRANSACTION -- start a new transaction
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  UPDATE account SET balance = balance - 100 WHERE account_id = 1
  COMMIT -- make all changes permanent
  ```

---

## Failure before commit

- Initially, the total balance of the bank is 900 euros:

  | account_id | balance |
  | ---------- | ------- |
  | 1          | 300     |
  | 2          | 600     |

- We execute a bank transfer in an **SQL transaction** to transfer 100 euros from account 1 to account 2, but theres a failure before the transaction is commited:

  ```sql
  BEGIN TRANSACTION -- start a new transaction
  UPDATE account SET balance = balance + 100 WHERE account_id = 2
  -- 💥 Failure in either user's or DBMS end
  ```

---

## Automatic rollback

- Due to the failure, the second `UPDATE` statement and the `COMMIT` statement are never executed
- Since the transaction is never successfully committed, **none of its changes are permanently applied** This includes changes made by statements executed before the failure
- If the client application crashes or the client computer shuts down, the database connection is lost. The DBMS detects the connection loss and **automatically rolls back the uncommitted transaction**.
- If the failure occurs on the DBMS side (e.g. a system crash), the DBMS uses its **recovery mechanism on restart to roll back uncommitted transactions**

---

## Consistent state after rollback

- Automatic rollback ensures that a failed transaction does not leave the database in a partially updated or inconsistent state
- The DBMS will automatically **undo the first update** and the total balance retrieved from the database is 900:

  | account_id | balance |
  | ---------- | ------- |
  | 1          | 300     |
  | 2          | 600     |

---

## Transaction modes

- **Transaction mode** determines how transactions are started and managed within a database connection
- A database connection typically operates in either **explicit transaction mode** or **implicit transaction mode**
- In **explicit transaction mode** (the default in SQL Server), a transaction must be started manually by executing the `BEGIN TRANSACTION` statement
- In **implicit transaction mode**, transactions are started automatically when an executable SQL statement is executed. There is no need to execute `BEGIN TRANSACTION` explicitly
- An implicit transaction begins with the first executable SQL statement after the connection is opened or after the previous transaction has been committed or rolled back

---

## Concurrency control

- The DBMS must protect **database consistency while maintaining good performance**
- In a multi-user environment, the DBMS needs to **interleave the operations of multiple transactions** while ensuring that they do not interfere with each other. For example, multiple transactions should be able to read the same row concurrently without unnecessarily waiting for one another
- **Concurrency control** refers to the mechanisms used by the DBMS to coordinate concurrent transactions and prevent unwanted interference between them
- The goal is to make transactions behave as if they were **executing in isolation**, even when their operations are interleaved with those of other transactions
- The transaction's **isolation level** controls how much a transaction is isolated from the changes made by other concurrently running transactions

---

## Locking mechanism

- Data consistency and transaction isolation can be achieved through a **locking mechanism**
- When a transaction modifies a row using `INSERT`, `UPDATE`, or `DELETE`, the DBMS acquires a **lock** on the affected row
- Other concurrent transactions are **prevented from modifying the locked row** until the lock is released, ensuring that their changes do not interfere with the ongoing transaction
- Transactions that attempt to modify the same row must **wait until the lock is released**, typically when the first transaction commits or rolls back

```sql
BEGIN TRANSACTION
-- 🔒 this will lock the row from changes
DELETE FROM Account WHERE account_id = 1;
-- ...
COMMIT -- committing releases all the locks
```

---

## Lock waiting example

- For example, if **user A** starts a transaction which **updates** a row in the `Account` table:

  ```sql
  BEGIN TRANSACTION
  -- 🔒 this will lock the row from changes
  UPDATE Account SET balance = 5000 WHERE account_id = 1;
  ```

- Then, **user B** starts a transaction which **updates** the locked row in the `Account` table:

  ```sql
  BEGIN TRANSACTION
  -- ⏲️ the row is locked, the transaction has to wait until the user A's transaction ends
  UPDATE Account SET balance = 6000 WHERE account_id = 1;
  ```

- The transaction of user B has to wait until the user A transaction ends (`COMMIT` or `ROLLBACK`)

---

## Blocking and deadlocks

- Locking resolves concurrency conflicts by either **blocking a transaction** or **forcing a transaction to abort**
- When a transaction is blocked, it must wait until the required resource becomes available. By default, the maximum waiting time is unlimited
- If two or more transactions **permanently block each other**, the DBMS detects the situation and **forces one of the transactions to abort** (rollback). This releases its locks and allows the other transaction to continue
- A **deadlock** occurs when two or more transactions are waiting for each other to release locks. For example, each transaction holds a lock on a resource that another transaction needs, creating a cycle of dependencies

---

<div style="display: grid; grid-template-columns: repeat(2, 1fr); grid-gap: 0px 16px;">
<div style="position: relative">
<div style="position: absolute; left: 0rem; top: -1.5rem"><strong>User A</strong></div>

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
<div style="position: relative">
<div style="position: absolute; left: 0rem; top: -7.5rem"><strong>User B</strong></div>

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
-- must wait for user B
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
-- must wait for user A
WHERE account_id = 1
```

</div>

</div>

---

## Deadlock steps

- The following things happen in the example:
  1. User A locks account 1 and updates it
  2. User B locks account 2 and updates it
  3. User A is trying to lock account 2 (must wait, B has already locked the row)
  4. User B is trying to lock account 1 (must wait, A has already locked the row)
- User B cannot continue until user A completes, but user A is blocked by user B. This cycle is a deadlock

---

## Deadlock resolution

- Both transactions in the deadlock will wait unless the deadlock is broken by the DBMS
- When the DBMS detects a deadlock it chooses one of the transactions as a victim and terminates it (rollback) with an error message
- This allows the other transaction to continue normally
- Locks protect our data but **decrease concurrency** and thus performance. Even without a deadlock a transaction can make others wait for a long time

---

## Row-level locking in SQL Server

- When a transaction acquires a lock on a row, the lock **controls whether other transactions can read or modify that row**
- The behavior depends on the **lock type**, which include **write lock** (acquired when a transaction modifies a row) and **read lock** (acquired when a transaction reads a row)
- SQL Server also supports an **update lock**, which helps prevent certain types of deadlocks when transactions first read data and then attempt to modify it

---

## Write lock

- When a transaction wants to **modify a row** (using `INSERT`, `UPDATE`, or `DELETE`), it must acquire a **write lock** on the row

  ```sql
  BEGIN TRANSACTION
  -- 🔒 acquire a write lock on account 1
  UPDATE Account SET balance = 6000 WHERE account_id = 1;
  ```

- ⚠️ A transaction must **the row is free from all other locks** before it can acquire a write lock
- While a transaction holds a write lock on a row, **other transactions cannot read or modify that row**. They must wait until the lock is released
- A write lock is **held until the transaction ends** (either through `COMMIT` or `ROLLBACK`)

---

## Read lock

- When a transaction wants to **read a row** (using `SELECT`), it must acquire a **read lock** on the row

  ```sql
  BEGIN TRANSACTION
  -- 🔒 acquire a read lock on account 1
  SELECT balance FROM Account WHERE account_id = 1;
  ```

- ⚠️ If another transaction holds a **write lock on the row**, the transaction must wait until that lock is released
- If there is no write lock on the row, the transaction can acquire a read lock and read the row
- A read lock is released depending on the transaction's **isolation level**, either immediately or after the transaction ends

---

## Isolation levels and read locks

```sql
-- specify the transaction's isolation level
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
-- 🔒 acquire read lock for account 1
SELECT balance FROM Account WHERE account_id = 1;
```

- The transaction's **isolation level** determines how long read locks are held
- With `READ COMMITTED` (the default isolation level), a read lock is **released after the read operation completes**
- With `REPEATABLE READ` or `SERIALIZABLE`, read locks are **held until the transaction ends**, providing stronger isolation
- These isolation levels prevent other transactions from modifying rows that have already been read, ensuring that **repeating the same read within a transaction returns the same values**

---

## SQL Server's update lock

- In SQL Server, we can use the non-standard `(UPDLOCK)` locking hint that prevents a certain form of deadlocks that occur when two transactions are first reading the same row and then updating the row
- The DBMS allows only one transaction at time to **read the same row** with the `(UPDLOCK)` locking hint
- If another transaction tries to read the same row with the `(UPDLOCK)` locking hint, it has to wait until the first transaction ends

```sql
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
-- 🔒 acquire "intent to update" lock for account 1
SELECT balance FROM Account (UPDLOCK) WHERE account_id = 1
```

---

## Summary of lock types

| Statement                          | Acquired lock type | Allowed locks on the same row                          |
| ---------------------------------- | ------------------ | ------------------------------------------------------ |
| `UPDATE`, `DELETE`, `INSERT`       | Write lock         | **None**                                               |
| `SELECT`                           | Read lock          | Any number of **read locks** and a **update lock**     |
| `SELECT` with the `(UPDLOCK)` hint | Update lock        | Any number of **read locks** (but **no update locks**) |

---

## Summary

- **Database transactions** provide a way to perform multiple database operations in a single independent unit of work which either succeeds or fails as a whole
- Database transactions ensure that the database properly changes states upon a successfully committed transaction
- Changes of failed database transactions are rolled back by the DBMS
- The **concurrency control** mechanism ensures that concurrently running transactions do not interfere with each other, so each transaction behaves as if it were running in isolation
- Transaction **locks database rows** while reading and modifying a row and other transactions that want to access the locked row **must wait** until the transaction ends
- **Deadlock** occurs when two (or more) transactions permanently block each other by each transaction having a lock on a resource which the other transaction is trying to lock
