# Expense Tracker Database Setup and Verification

This document provides detailed steps to set up and verify various database topics including subqueries, user privileges, indexes, views, and transactions in the Expense Tracker database.

## Table of Contents

1. [Subqueries](#subqueries)
2. [User Privileges](#user-privileges)
    - [Create and Set Privileges](#create-and-set-privileges)
    - [Verify `readonly` User Privileges](#verify-readonly-user-privileges)
    - [Verify `admin` User Privileges](#verify-admin-user-privileges)
3. [Indexes](#indexes)
4. [Views](#views)
5. [Transactions](#transactions)

## Subqueries

### Verify Subqueries

1. Open MySQL Workbench and connect to your database.

2. Open a new SQL tab and run the following subquery to verify:

    ```sql
    -- Find users who have spent more than a certain amount in total
    SELECT username 
    FROM Users 
    WHERE user_id IN (
        SELECT user_id 
        FROM Expenses 
        GROUP BY user_id 
        HAVING SUM(amount) > 100
    );
    ```

3.Evidence

![Evidence Subqueries](https://github.com/AnhCB/photosSQL/blob/main/subqueries.png)

## User Privileges

### Create and Set Privileges

1. Open MySQL Workbench and run the following commands to create the `readonly` and `admin` users with the appropriate privileges:
(Can skip this step since my schema script on Github already updated it.)
    ```sql
    -- Drop existing users if they exist
    DROP USER IF EXISTS 'readonly'@'localhost';
    DROP USER IF EXISTS 'admin'@'localhost';

    -- Create a read-only user
    CREATE USER 'readonly'@'localhost' IDENTIFIED BY '123456';
    GRANT SELECT ON expense_tracker.* TO 'readonly'@'localhost';

    -- Create an admin user with full privileges
    CREATE USER 'admin'@'localhost' IDENTIFIED BY '123456';
    GRANT ALL PRIVILEGES ON expense_tracker.* TO 'admin'@'localhost';

    -- Apply the changes
    FLUSH PRIVILEGES;
    ```

### Verify `readonly` User Privileges

1. **Open Command Line Interface:**
   - Open a terminal or command prompt on your computer.

2. **Log in as `readonly` User:**
   ```sql
   mysql -u readonly -p
   ```

Enter the password "123456" when prompted.

3. Run the following commands to verify the readonly user's privileges

```sql
-- Select the database
USE expense_tracker;

-- Try to select data (should succeed)
SELECT * FROM Users;

-- Try to insert data (should fail)
INSERT INTO Users (username, password, email) VALUES ('testuser', 'testpassword', 'testuser@example.com');

-- Try to update data (should fail)
UPDATE Users SET email = 'newemail@example.com' WHERE username = 'readonlyuser';

-- Try to delete data (should fail)
DELETE FROM Users WHERE username = 'readonlyuser';
```
4. Evidence
![Evidence Readonly](https://github.com/AnhCB/photosSQL/blob/main/readonly%20priviledge.png)

### Verify `admin` User Privileges

1. **Log out from the `readonly` user**:
   - Type `exit` and press Enter to log out.

2. **Log in as the `admin` user**:
   - Open a terminal or command prompt and enter:
     ```sh
     mysql -u admin -p
     ```
   - Enter the password `123456` when prompted.

3. **Run the following commands** inside the MySQL command line interface:

    ```sql
    -- Select the database
    USE expense_tracker;

    -- Try to select data (should succeed)
    SELECT * FROM Users;

    -- Try to insert data (should succeed)
    INSERT INTO Users (username, password, email) VALUES ('adminuser', 'adminpassword', 'adminuser@example.com');

    -- Try to update data (should succeed)
    UPDATE Users SET email = 'updatedemail@example.com' WHERE username = 'adminuser';

    -- Try to delete data (should succeed)
    DELETE FROM Users WHERE username = 'adminuser';
    ```
4. Evidence
![Evidence Admin](https://github.com/AnhCB/photosSQL/blob/main/admin%20priviledge.png)

## Indexes

### Verify Indexes

1. Open MySQL Workbench and run the following commands to check if the indexes have been created:

    ```sql
    -- Check indexes on Expenses table
    SHOW INDEXES FROM Expenses;

    -- Check indexes on Income table
    SHOW INDEXES FROM Income;
    ```
2. Evidence

![Evidence Index](https://github.com/AnhCB/photosSQL/blob/main/index.png)
   
## Views

### Verify Views

1. Open MySQL Workbench and run the following commands to verify the views:

    ```sql
    -- Verify UserExpenses view
    SELECT * FROM UserExpenses;

    -- Verify UserIncome view
    SELECT * FROM UserIncome;
    ```

2. Evidence

![Evidence View](https://github.com/AnhCB/photosSQL/blob/main/view.png)
## Transactions

### Verify Transactions

1. Open MySQL Workbench and run the following commands to test transactions:

    ```sql
    -- Start a transaction
    START TRANSACTION;

    -- Insert a new expense
    INSERT INTO Expenses (user_id, amount, category_id, place_id, payment_type_id, emotion_id, description, date)
    VALUES (1, 100.00, 1, 1, 1, 1, 'Test transaction', '2023-06-15');

    -- Check the inserted expense
    SELECT * FROM Expenses WHERE description = 'Test transaction';

    -- Rollback the transaction
    ROLLBACK;

    -- Verify that the expense is not present
    SELECT * FROM Expenses WHERE description = 'Test transaction';
    ```

---

