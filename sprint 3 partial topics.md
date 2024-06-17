# Expense Tracker Database Setup and Verification

This document provides detailed steps to set up and verify various database topics including subqueries, user privileges, indexes, views, and transactions in the Expense Tracker database.
## ERD Diagram

![ERD Diagram](ERD_diagram.png)
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


## User Privileges

### Create and Set Privileges

1. Open MySQL Workbench and run the following commands to create the `readonly` and `admin` users with the appropriate privileges:

    ```sql
    -- Drop existing users if they exist
    DROP USER IF EXISTS 'readonly'@'localhost';
    DROP USER IF EXISTS 'admin'@'localhost';

    -- Create a read-only user
    CREATE USER 'readonly'@'localhost' IDENTIFIED BY 'password';
    GRANT SELECT ON expense_tracker.* TO 'readonly'@'localhost';

    -- Create an admin user with full privileges
    CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpassword';
    GRANT ALL PRIVILEGES ON expense_tracker.* TO 'admin'@'localhost';

    -- Apply the changes
    FLUSH PRIVILEGES;
    ```

### Verify `readonly` User Privileges

1. **Open Command Line Interface:**
   - Open a terminal or command prompt on your computer.

2. **Log in as `readonly` User:**
   ```sh
   mysql -u readonly -p
