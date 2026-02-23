# Database transaction exercises

> [!IMPORTANT]
> Write your answers to a Word document named `transaction_exercises_YOURFAMILYNAME.docx` and submit the document to Moodle.

The objectives of this exercise are to:

- To have hands-on experiences on database transactions.
- To observe the effects of `COMMIT` and `ROLLBACK`.
- To see what can happen when two users are accessing the same data simultaneously.
- To observe how the DBMS uses locking to handle concurrency conflicts in multi-user environment.
- To experience deadlocks and to see how a common form of deadlock can be avoided.
- To observe the differences between the transaction isolation levels `READ COMMITTED`, `REPEATABLE READ`, and `SERIALIZABLE`.

## Instructions

- You can copy and paste the SQL statements from this material to a query window in SQL Server Management Studio.
- _You have to be very careful not to miss any details when you execute the given SQL statements_. If you accidentally miss some detail, start the task again.

## Task 1: Creating a table for testing

Copy and paste the following to the query window and execute all the statements:

```sql
-- Create the Account table
CREATE TABLE Account (
 accountNumber INT NOT NULL,
 balance INT NOT NULL DEFAULT 0,
 CONSTRAINT PK_Account PRIMARY KEY (accountNumber)
);
-- Insert test data into the Account table
INSERT INTO Account (accountNumber, balance) VALUES (1, 1000);
INSERT INTO Account (accountNumber, balance) VALUES (2, 1000);

SELECT accountNumber, balance FROM Account;
```

Finally, you should see details of two accounts as follows:

| accountNumber | balance |
| ------------- | ------- |
| 1             | 1000    |
| 2             | 1000    |

> [!TIP]
> If something goes wrong later, you can always reset the original account balances by executing the following statement: `UPDATE Account SET balance = 1000;`

## Task 2: Transaction basics

Let's have a look how to begin a transaction and complete it by either committing the changes or reverting them.

> [!TIP]
> If you accidentally miss any statements in any of the tasks, you have to redo the whole task. Before you redo the task, you have to make sure that no transaction is still running. To be safe, execute the following statements one at a time before you start over:
>
> ```sql
> ROLLBACK;
> DELETE FROM Account;
> INSERT INTO Account (accountNumber, balance) VALUES (1, 1000);
> INSERT INTO Account (accountNumber, balance) VALUES (2, 1000);
> ```

Copy and paste the following to the query window and execute the statements _one at a time_:

```sql
BEGIN TRANSACTION;
DELETE FROM Account;
SELECT * FROM Account;
ROLLBACK;
SELECT * FROM Account;
```

Questions to answer:

1. How many rows does the first `SELECT` show?
2. How many rows does the second `SELECT` show?

> [!IMPORTANT]
> Write the answers to the questions to your submission Word document.

## Task 3

Execute the following statements _one at a time_:

```sql
BEGIN TRANSACTION;
INSERT INTO Account (accountNumber, balance) VALUES (3, 1000);
INSERT INTO Account (accountNumber, balance) VALUES (4, 1000);
UPDATE Account SET balance = 40 WHERE accountNumber = 4;
SELECT * FROM Account;
ROLLBACK;
SELECT * FROM Account;
```

Questions to answer:

1. What is the total balance of the accounts before the `ROLLBACK`?
2. What is the total balance of the accounts after the `ROLLBACK`?

## Task 4

Execute the following statements _one at a time_:

```sql
BEGIN TRANSACTION;
INSERT INTO Account (accountNumber, balance) VALUES (3, 1000);
SELECT * FROM Account;
UPDATE Account SET balance = 20 WHERE accountNumber = 3;
SELECT * FROM Account; 
COMMIT;
SELECT * FROM Account;
```

Questions to answer:

1. What is the total balance of the accounts before the `COMMIT`?
2. What is the total balance of the accounts after the `COMMIT`?

## Task 5: Concurrency conflict in multi-user environment (autocommit mode)

First, restore the test data in the `Account` table to its original state as follows:

```sql
ROLLBACK; -- Do not worry if you get an error message from this
DELETE FROM Account;
INSERT INTO Account (accountNumber, balance) VALUES (1, 1000);
INSERT INTO Account (accountNumber, balance) VALUES (2, 1000);
```

Then, do the following in SQL Server Management Studio:

1. Close all query windows.
2. To simulate two users executing simultaneous transactions, open _two_ new query windows for this task.
3. Arrange the two query windows side by side by clicking "Window" > "New Vertical Tab Group".

The two query windows will simulate two separate database users, who are executing database transactions simultaneously:

- In the task "user A" executes SQL statements via the query window _on the left_.
- In the task "user B" executes SQL statements via the query window _on the right_.

Let's assume that user A and user B are your friends who want to pay back the money they have
borrowed from you. Account number 1 is your own bank account, with initial balance of 1000. Your friends want to perform the following deposits:

- User A wants to _deposit 900 to your account_.
- User B wants to _deposit 5000 to your account_.

The balance after the both deposits should be 6900.

Now, execute the following statements as instructed above:

> [!CAUTION]
> Execute the statements in the corresponding query window _in this specific order_. Remember, user A 🟢 executes statements on the query window on the left and user B 🔵 on the right.

```sql
-- 1. User A 🟢:
SELECT balance FROM Account WHERE accountNumber = 1;
```

```sql
-- 2. User B 🔵:
SELECT balance FROM Account WHERE accountNumber = 1;
```

> [!NOTE]
> Both user A and user B see the balance of your account as 1000 and calculate the new balance based on that information.
>
> - User A calculates the new balance as follows: `1000 + 900 = 1900`.
> - User B calculates the new balance as follows: `1000 + 5000 = 6000`.

```sql
-- 3. User B 🔵:
UPDATE Account SET balance = 6000 WHERE accountNumber = 1;
SELECT balance FROM Account WHERE accountNumber = 1;
```

```sql
-- 4. User A 🟢:
UPDATE Account SET balance = 1900 WHERE accountNumber = 1;
SELECT balance FROM Account WHERE accountNumber = 1;
```

Questions to answer:

Now both user A and user B are happy. Both deposits have been executed successfully. How about you?

1. Are you happy with the balance of your bank account (i.e. account number 1)?
2. Explain shortly what the problem is.

## Important instructions for the remaining tasks

In the next tasks, there will be such concurrency conflicts that due to locking either transaction will be blocked. That is, nothing seems to be happening after you have executed an SQL statement in one of the two query windows. When you look at the timer at the left lower corner of the query window, you see the stopwatch time increasing, but nothing else happens.

You should proceed in the following way in this kind of situation:

1. Let's say that user B executes an SQL statement in their own transaction and then finds out that their transaction is blocked.
2. In this situation, user A should continue by executing all the SQL statements in their own transaction's next step.
3. If user B's transaction is still blocked, then user A should continue by executing all the SQL statements in their own transaction's next step.
4. Finally, (after user A's transaction is terminated) user B should continue executing SQL statements in their own transaction.

> [!NOTE]
> Sometimes the DBMS aborts either transaction. That is, then the aborted transaction cannot be continued any more.

## Task 6: Explicit transactions in the default transaction isolation level

Start by doing the following:

1. Clear the contents of the two query windows.
2. To make sure that we do not have any non-terminated transactions and reset all account balances, execute the following SQL statements in _both query windows_:

   ```sql
   ROLLBACK;
   UPDATE Account SET balance = 1000;
   ```

> [!NOTE]
> If you get an error message about "missing BEGIN TRANSACTION", just ignore it.

Then, execute the following statements like you did in the previous task:

```sql
-- 1. User A 🟢:
BEGIN TRANSACTION;
SELECT balance FROM Account WHERE accountNumber = 1;
```

```sql
-- 2. User B 🔵:
BEGIN TRANSACTION;
SELECT balance FROM Account WHERE accountNumber = 1;
```

> [!NOTE]
> Both user A and user B see the balance of your account as 1000 and calculate the new balance based on that information.
>
> - User A calculates the new balance as follows: `1000 + 900 = 1900`.
> - User B calculates the new balance as follows: `1000 + 5000 = 6000`.

```sql
-- 3. User B 🔵:
UPDATE Account SET balance = 6000 WHERE accountNumber = 1;
```

```sql
-- 4. User A 🟢:
UPDATE Account SET balance = 1900 WHERE accountNumber = 1;
```

```sql
-- 5. User B 🔵:
COMMIT;
SELECT balance FROM Account WHERE accountNumber = 1;
```

```sql
-- 6. User A 🟢:
COMMIT;
SELECT balance FROM Account WHERE accountNumber = 1;
```

Questions to answer:

1. What is the final balance of account 1?
2. What would you say about the situation?

## Task 7: Experiencing a deadlock

> _"A deadlock occurs when two or more tasks permanently block each other by each task having a lock on a resource that the other tasks are trying to lock."_ - [SQL Server documentation](https://learn.microsoft.com/en-us/sql/relational-databases/sql-server-deadlocks-guide?view=sql-server-ver17)

Let's have a look at situation where a _deadlock_ occurs and how the DBMS solves it.

Start by doing the following:

1. Clear the contents of the two query windows.
2. To make sure that we do not have any non-terminated transactions and reset all account balances, execute the following SQL statements in _both query windows_:

   ```sql
   ROLLBACK;
   UPDATE Account SET balance = 1000;
   ```

> [!NOTE]
> If you get an error message about "missing BEGIN TRANSACTION", just ignore it.

Then, execute the following statements like you did in the previous task:

```sql
-- 1. User A 🟢:
BEGIN TRANSACTION;
UPDATE Account SET balance = 6000 WHERE accountNumber = 1;
```

```sql
-- 2. User B 🔵:
BEGIN TRANSACTION;
UPDATE Account SET balance = 2000 WHERE accountNumber = 2;
```

```sql
-- 3. User A 🟢:
UPDATE Account SET balance = 6000 WHERE accountNumber = 2;
```

```sql
-- 4. User B 🔵:
UPDATE Account SET balance = 2000 WHERE accountNumber = 1;
```

> [!NOTE]
> Wait, wait, wait... what happens now? If you see a message from the DBMS, take notes on the message content. 🕵️

```sql
-- 5. User A 🟢:
COMMIT;
```

```sql
-- 6. User B 🔵:
COMMIT;
```

```sql
-- 7. User A 🟢:
SELECT * FROM Account;
```

```sql
-- 8. User B 🔵:
SELECT * FROM Account;
```

Questions to answer:

1. What are the final balances of accounts 1 and 2?
2. Is the database in a consistent state now?
3. Explain what has happened.

## Task 8. Explicit transactions in the transaction isolation level REPEATABLE READ

> _"The Repeatable Read isolation level only sees data committed before the transaction began; it never sees either uncommitted data or changes committed by concurrent transactions during the transaction's execution."_ - [PostgreSQL documentation](https://www.postgresql.org/docs/current/transaction-iso.html)

Transaction with the `REPEATABLE READ` isolation level holds the read-lock on a row until the transaction completes. This means that no other transaction can update the row until the transaction completes. Meaning, if we read a row once inside a transaction, _we can repeat that same read and get the same result_. Let's have a look how this works in practice.

Start by doing the following:

1. Clear the contents of the two query windows.
2. To make sure that we do not have any non-terminated transactions and reset all account balances, execute the following SQL statements in _both query windows_:

   ```sql
   ROLLBACK;
   UPDATE Account SET balance = 1000;
   ```

Then, execute the following statements like you did in the previous task:

```sql
-- 1. User A 🟢:
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION;
SELECT balance FROM Account WHERE accountNumber = 1;
```

```sql
-- 2. User B 🔵:
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION;
SELECT balance FROM Account WHERE accountNumber = 1;
```

> [!NOTE]
> Both user A and user B see the balance of your account as 1000 and calculate the new balance based on that information.
>
> - User A calculates the new balance as follows: `1000 + 900 = 1900`.
> - User B calculates the new balance as follows: `1000 + 5000 = 6000`.

```sql
-- 3. User B 🔵:
UPDATE Account SET balance = 6000 WHERE accountNumber = 1;
```

```sql
-- 4. User A 🟢:
UPDATE Account SET balance = 1900 WHERE accountNumber = 1;
```

> [!NOTE]
> Wait, wait, wait... what happens now? If you see a message from the DBMS, take notes on the message content. 🕵️

```sql
-- 5. User B 🔵:
COMMIT;
```

```sql
-- 6. User A 🟢:
COMMIT;
```

```sql
-- 7. User B 🔵:
SELECT balance FROM Account WHERE accountNumber = 1;
```

```sql
-- 8. User A 🟢:
SELECT balance FROM Account WHERE accountNumber = 1;
```

Questions to answer:

1. What are the final balances of accounts 1 and 2?
2. Is the database in a consistent state now?
3. Explain shortly what happened.

## Task 9: Transaction isolation levels REPEATABLE READ vs. READ COMMITTED

Start by doing the following:

1. Clear the contents of the two query windows.
2. To make sure that we do not have any non-terminated transactions and reset all account balances, execute the following SQL statements in _both query windows_:

   ```sql
   ROLLBACK;
   UPDATE Account SET balance = 1000;
   ```

Then, execute the following statements like you did in the previous task:

```sql
-- 1. User A 🟢:
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION;
SELECT SUM(balance) FROM Account;
```

```sql
-- 2. User B 🔵:
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
UPDATE Account SET balance = balance + 500 WHERE accountNumber = 1;
```

```sql
-- 3. User A 🟢:
SELECT SUM(balance) FROM Account;
COMMIT;
```

```sql
-- 4. User B 🔵:
SELECT SUM(balance) FROM Account;
COMMIT;
```

Question to answer:

1. Did either of the transactions have to wait for the other to commit?

## Task 10

Start by doing the following:

1. Clear the contents of the two query windows.
2. To make sure that we do not have any non-terminated transactions and reset all account balances, execute the following SQL statements in _both query windows_:

   ```sql
   ROLLBACK;
   UPDATE Account SET balance = 1000;
   ```

Then, execute the following statements like you did in the previous task:

```sql
-- 1. User A 🟢:
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
SELECT SUM(balance) FROM Account;
```

```sql
-- 2. User B 🔵:
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
UPDATE Account SET balance = balance + 500 WHERE accountNumber = 1;
```

```sql
-- 3. User A 🟢:
SELECT SUM(balance) FROM Account;
COMMIT;
```

```sql
-- 4. User B 🔵:
SELECT SUM(balance) FROM Account;
COMMIT;
```

Questions to answer:

1. Did either of the transactions have to wait for the other to commit?
2. Explain why the results are different from the previous task.

## Task 11. Using the locking hint (UPDLOCK) to prevent a common form of deadlock

In SQL Server, you can use the non-standard `(UPDLOCK)` locking hint that prevents a common form of deadlock that occurs when two transactions are first reading the same row and then updating the row. The DBMS allows only one transaction at time to read the row with the `(UPDLOCK)` locking hint. If another transaction tries to read the same row with the `(UPDLOCK)` locking hint, it has to wait until the first transaction ends.

Start by doing the following:

1. Clear the contents of the two query windows.
2. To make sure that we do not have any non-terminated transactions and reset all account balances, execute the following SQL statements in _both query windows_:

   ```sql
   ROLLBACK;
   UPDATE Account SET balance = 1000;
   ```

Then, execute the following statements like you did in the previous task:

```sql
-- 1. User A 🟢:
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION;
SELECT balance FROM Account (UPDLOCK) WHERE accountNumber = 1;
```

```sql
-- 2. User B 🔵:
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION;
SELECT balance FROM Account (UPDLOCK) WHERE accountNumber = 1;
```

> [!NOTE]
> Both user A and user B see the balance of your account as 1000 and calculate the new balance based on that information.
>
> - User A calculates the new balance as follows: `1000 + 900 = 1900`.
> - User B calculates the new balance as follows: `1000 + 5000 = 6000`.

```sql
-- 3. User B 🔵:
UPDATE Account SET balance = 6000 WHERE accountNumber = 1;
```

```sql
-- 4. User A 🟢:
UPDATE Account SET balance = 1900 WHERE accountNumber = 1;
```

```sql
-- 5. User B 🔵:
COMMIT;
```

```sql
-- 6. User A 🟢:
COMMIT;
```

```sql
-- 7. User B 🔵:
SELECT balance FROM Account WHERE accountNumber = 1;
```

```sql
-- 8. User A 🟢:
SELECT balance FROM Account WHERE accountNumber = 1;
```

Questions to answer:

1. What is the final balance of account 1?
2. Is the database in a consistent state now?
3. Explain shortly what happened.

## Task 11: Experiencing the "phantom problem"

> _"The so-called phantom problem occurs within a transaction when the same query produces different sets of rows at different times. For example, if a SELECT is executed twice, but returns a row the second time that was not returned the first time, the row is a "phantom" row."_ - [MySQL documentation](https://dev.mysql.com/doc/refman/8.4/en/innodb-next-key-locking.html)

The `REPEATABLE READ` isolation level protects existing rows from being modified. However, _it does not prevent new rows from being inserted that match the query_. Let's have a look at how this works in practice.

> [!IMPORTANT]
> In the remaining tasks, we suppose that the rows in the `Account` table represent loans and _the total of loan balances should not exceed 3000 euros_. Before inserting a new loan, the user needs to make sure it doesn't exceed the maximum loan balance.

Start by doing the following:

1. Clear the contents of the two query windows.
2. To make sure that we do not have any non-terminated transactions and reset all account balances, execute the following SQL statements in _both query windows_:

   ```sql
   ROLLBACK;
   DELETE FROM Account;
   -- We'll start with two loans, totaling 2000 euros
   INSERT INTO Account (accountNumber, balance) VALUES (1, 1000);
   INSERT INTO Account (accountNumber, balance) VALUES (2, 1000);
   ```

Then, execute the following statements like you did in the previous task:

```sql
-- 1. User A 🟢:
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION;
SELECT SUM(balance) FROM Account;
```

```sql
-- 2. User B 🔵:
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION;
SELECT SUM(balance) FROM Account;
```

> [!NOTE]
> _The total of loan balances should not exceed 3000 euros_. Now you are deciding if you are allowed to insert a new loan with the balance of 700 euros. You have already selected the sum of loan balances. If the sum is less or equal to 2300, then insert the new loan as below. Otherwise, do not execute the insert statement.

```sql
-- 4. User B 🔵:
INSERT INTO Account (accountNumber, balance) VALUES (4, 900);
COMMIT;
```

```sql
-- 5. User A 🟢:
COMMIT;
SELECT SUM(balance) FROM Account;
```

Questions to answer

1. Are you happy with the results?
2. Explain shortly what the problem is.

## Task 12: Preventing the "phantom problem"

> _"The Serializable isolation level provides the strictest transaction isolation. This level emulates serial transaction execution for all committed transactions; as if transactions had been executed one after another, serially, rather than concurrently._" - [PostgreSQL documentation](https://www.postgresql.org/docs/current/transaction-iso.html)

Let's have a look how the [SERIALIZABLE](https://learn.microsoft.com/en-us/sql/t-sql/statements/set-transaction-isolation-level-transact-sql?view=sql-server-ver17#serializable) isolation level differences from the `REPEATABLE READ` isolation level.

Start by doing the following:

1. Clear the contents of the two query windows.
2. To make sure that we do not have any non-terminated transactions and reset all account balances, execute the following SQL statements in _both query windows_:

   ```sql
   ROLLBACK;
   DELETE FROM Account;
   -- We'll start with two loans, totaling 2000 euros
   INSERT INTO Account (accountNumber, balance) VALUES (1, 1000);
   INSERT INTO Account (accountNumber, balance) VALUES (2, 1000);
   ```

Then, execute the following statements like you did in the previous task:

```sql
-- 1. User A 🟢:
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;
SELECT SUM(balance) FROM Account;
```

```sql
-- 2. User B 🔵:
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;
SELECT SUM(balance) FROM Account;
```

> [!NOTE]
> _The total of loan balances should not exceed 3000 euros_. Now you are deciding if you are allowed to insert a new loan with the balance of 700 euros. You have already selected the sum of loan balances. If the sum is less or equal to 2300, then insert the new loan as below. Otherwise, do not execute the insert statement.

```sql
-- 3. User A 🟢:
INSERT INTO Account (accountNumber, balance) VALUES (3, 700);
```

> [!NOTE]
> Now you are deciding if you are allowed to insert a new loan with the balance of 900 euros. You have already selected the sum of loan balances. If the sum is less or equal to 2100, then insert the new loan as below. Otherwise, just execute the `COMMIT` statement.

```sql
-- 4. User B 🔵:
INSERT INTO Account (accountNumber, balance) VALUES (4, 900);
COMMIT;
```

```sql
-- 5. User A 🟢:
COMMIT;
SELECT SUM(balance) FROM Account;
```

Questions to answer:

1. What is the total balance now?
2. Are you happy with the results?

## Task 13: Important Transaction Concepts

Study and explain the following concepts in your own words.

1. Explain shortly why a DBMS should provide proper transaction management services.
2. What are the ACID properties? Provide two examples illustrating problems that could occur if one or more of these properties were not enforced.
3. How do the transaction isolation levels `READ COMMITTED` and `REPEATABLE READ` differ from each other? Refer to your experiences on the previous tasks.

## Task 14

You are a Database Developer implementing a feature to an online store, which allows a customer to place an order on a product. Placing an order requires the following steps:

1. Check that the product is in stock.
2. Reduce the inventory count by 1.
3. Create a new order record.
4. Process the customer's payment.
5. Generate an invoice and confirmation number.

Your fellow Database Developer is convinced that the feature doesn't require a database transaction. Convince your colleague otherwise by providing possible problems that can occur in this case without the proper use of database transactions.
