DROP TABLE Account

CREATE TABLE Account (
 account_id INT NOT NULL,
 balance INT NOT NULL DEFAULT 0,
 CONSTRAINT PK_Account PRIMARY KEY (account_id)
)

DELETE FROM Account
INSERT INTO Account (account_id, balance) VALUES (1, 1000)
INSERT INTO Account (account_id, balance) VALUES (2, 1000)

-- Example 1: Commit and rollback

SELECT account_id, balance FROM Account

-- start a new transaction
BEGIN TRANSACTION 
UPDATE account SET balance = balance + 100 WHERE account_id = 2
UPDATE account SET balance = balance - 100 WHERE account_id = 1
SELECT account_id, balance FROM Account
ROLLBACK -- undo all changes permanent

SELECT account_id, balance FROM Account

BEGIN TRANSACTION 
UPDATE account SET balance = balance + 100 WHERE account_id = 2
UPDATE account SET balance = balance - 100 WHERE account_id = 1
SELECT account_id, balance FROM Account
COMMIT -- make all changes permanent

SELECT account_id, balance FROM Account

-- Example 2: Locking

SELECT account_id, balance FROM Account

-- User A
BEGIN TRANSACTION
-- this will lock the row from changes
UPDATE Account SET balance = 5000 WHERE account_id = 1
COMMIT

-- User B
BEGIN TRANSACTION
-- the row is locked, the transaction has to wait until the user A's transaction ends
UPDATE Account SET balance = 6000 WHERE account_id = 1
COMMIT

SELECT account_id, balance FROM Account

-- Example 3: Deadlock

SELECT account_id, balance FROM Account

-- User A
BEGIN TRANSACTION
UPDATE Account SET balance = balance + 100 WHERE account_id = 1
UPDATE Account SET balance = balance - 100 WHERE account_id = 2
COMMIT

-- User B
BEGIN TRANSACTION
UPDATE Account SET balance = balance + 200 WHERE account_id = 2
UPDATE Account SET balance = balance - 200 WHERE account_id = 1
COMMIT

SELECT account_id, balance FROM Account

-- Example 4: Repeatable read isolation level

SELECT account_id, balance FROM Account

-- User A
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
-- SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
-- acquire read lock for account 1
SELECT balance FROM Account WHERE account_id = 1
-- with repeatable read isolation level, the row value won't change between reads
SELECT balance FROM Account WHERE account_id = 1
COMMIT

-- User B
BEGIN TRANSACTION
-- acquire write lock for account 1
UPDATE Account SET balance = 6000 WHERE account_id = 1;
COMMIT
