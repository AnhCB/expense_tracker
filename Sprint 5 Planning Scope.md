# Sprint 4 Planning Scope

## Goals

1. **Implement Check Constraints and Triggers**
    - Ensure data integrity and enforce business rules within the database.
    - Tasks:
        - Define check constraints on columns.
        - Create triggers to update logs or enforce complex business logic.

2. **Analyze Query Algorithms**
    - Evaluate the performance of SQL queries.
    - Tasks:
        - Run explain plans for complex queries.
        - Optimize queries based on analysis.

3. **Interface with an RDBMS**
    - Establish connections between the application and the RDBMS.
    - Tasks:
        - Connect to MySQL database using Python.
        - Implement basic CRUD operations through the application interface.

## Detailed Tasks

### 1. Implement Check Constraints and Triggers

#### Check Constraints

```sql
ALTER TABLE FinancialEntry
ADD CONSTRAINT chk_amount CHECK (amount > 0);

ALTER TABLE FinancialEntry
ADD CONSTRAINT chk_date CHECK (date <= CURRENT_DATE);

```

#### Triggers

```sql
DELIMITER $$
CREATE TRIGGER trg_after_insert_financialentry
AFTER INSERT ON FinancialEntry
FOR EACH ROW
BEGIN
    INSERT INTO Logs (user_id, action) VALUES (NEW.user_id, 'Inserted financial entry');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_before_insert_expensedetails
BEFORE INSERT ON ExpenseDetails
FOR EACH ROW
BEGIN
    IF NEW.category_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Category ID cannot be NULL';
    END IF;
END $$
DELIMITER ;
```

### 2. Analyze Query Algorithms

##### Analyze and Optimize Queries

```sql
EXPLAIN SELECT u.username, f.amount, f.date, c.category_name, p.place_name, pt.payment_method, em.emotion_name, e.description
FROM Users u
JOIN FinancialEntry f ON u.user_id = f.user_id
LEFT JOIN ExpenseDetails e ON f.entry_id = e.entry_id
LEFT JOIN Categories c ON e.category_id = c.category_id
LEFT JOIN Place p ON e.place_id = p.place_id
LEFT JOIN PaymentType pt ON e.payment_type_id = pt.payment_type_id
LEFT JOIN Emotions em ON e.emotion_id = em.emotion_id;
```

#### Optimize

```sql
CREATE INDEX idx_user_id ON FinancialEntry(user_id);
CREATE INDEX idx_entry_id ON ExpenseDetails(entry_id);
```

### 3. Interface 

```py
import mysql.connector

conn = mysql.connector.connect(
    host='localhost',
    user='yourusername',
    password='yourpassword',
    database='expense_tracker'
)

cursor = conn.cursor()

# Fetch data
cursor.execute("SELECT * FROM Users")
users = cursor.fetchall()

for user in users:
    print(user)

# Insert data
add_user = ("INSERT INTO Users (username, password, email) "
            "VALUES (%s, %s, %s)")
user_data = ('newuser', 'newpassword', 'newuser@example.com')
cursor.execute(add_user, user_data)
conn.commit()

cursor.close()
conn.close()
```
