# Sprint 4 Planning Scope

## Goals

1. **Logging & Recovery**
    - Implement logging mechanisms to track database changes.
    - Explore and demonstrate recovery techniques in the case of system failure.

2. **Concurrency & Isolation Levels**
    - Set up transactions with different isolation levels.
    - Implement read-only transactions.
    - Provide arguments and justification for the chosen isolation levels.

3. **Inheritance & Weak Entity Sets**
    - Refine the existing ERD to include inheritance and weak entity sets.
    - Update the ERD with these new concepts.

4. **Conceptual Design Quality**
    - Justify the quality and structure of the current ERD.
    - Apply any necessary improvements based on new learnings.

5. **Minimal Bases**
    - Identify and demonstrate the minimal set of Functional Dependencies (FDs).
    - Prepare for the next sprint where 3NF and 4NF will be covered.

## Detailed Plan

### Week 1: Logging & Recovery, Concurrency & Isolation Levels

1. **Logging & Recovery**:
    - Research different logging techniques (e.g., Write-Ahead Logging (WAL)).
    - Implement a basic logging mechanism to track changes in the `Expenses` and `Income` tables.
    - Demonstrate a recovery scenario where the database is restored to a consistent state after a simulated failure.

    ```sql
    -- Example of enabling general logging (for MySQL)
    SET GLOBAL general_log = 'ON';
    SET GLOBAL log_output = 'TABLE';
    ```

2. **Concurrency & Isolation Levels**:
    - Research and understand different isolation levels (READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ, SERIALIZABLE).
    - Set transactions to read-only where appropriate.
    - Change isolation levels for certain transactions and justify the choices.

    ```sql
    -- Example of setting transaction isolation level
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Example of setting a transaction to read-only
    START TRANSACTION READ ONLY;
    ```

### Week 2: Inheritance & Weak Entity Sets, Conceptual Design Quality, Minimal Bases

3. **Inheritance & Weak Entity Sets**:
    - Update the ERD to include inheritance and weak entity sets.
    - Create tables and relationships in the database to reflect these changes.

    ```sql
    -- Example of creating a weak entity set
    CREATE TABLE SubCategory (
        subcategory_id INT AUTO_INCREMENT PRIMARY KEY,
        category_id INT,
        subcategory_name VARCHAR(80) NOT NULL,
        FOREIGN KEY (category_id) REFERENCES Categories(category_id)
    );
    ```

4. **Conceptual Design Quality**:
    - Review the existing ERD and justify its quality.
    - Apply improvements based on new concepts learned.
    - Prepare a detailed explanation of why the ERD is well-designed.

5. **Minimal Bases**:
    - Identify the minimal set of functional dependencies (FDs) in the database.
    - Prepare for the next sprint to ensure the database schema is in 3NF and 4NF.

    ```sql
    -- Example of identifying minimal FDs (conceptual)
    -- Assume we have the following FDs for the Users table
    -- FD1: user_id -> username, email
    -- FD2: username -> user_id, email
    -- Minimal FD: user_id -> username, email
    ```

## Deliverables

1. **Logging & Recovery**:
    - Demonstrate logging of database changes.
    - Simulate a recovery scenario and show the recovery process.

2. **Concurrency & Isolation Levels**:
    - Show examples of transactions with different isolation levels.
    - Provide justification for the chosen isolation levels.

3. **Inheritance & Weak Entity Sets**:
    - Updated ERD with inheritance and weak entity sets.
    - Database tables reflecting the updated ERD.

4. **Conceptual Design Quality**:
    - A document or presentation justifying the quality of the ERD.
    - Applied improvements to the ERD.

5. **Minimal Bases**:
    - Identification of minimal functional dependencies.
    - Preparation for ensuring the database schema is in 3NF and 4NF.

---

By following this detailed plan, we aim to cover all the specified topics for Sprint 4 effectively. Each goal is aligned with the course objectives and provides a comprehensive approach to enhancing the Expense Tracker database.
