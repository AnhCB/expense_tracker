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
