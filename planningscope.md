# Sprint 1 Goals and Accomplishments

## Goals

For Sprint 1, the primary goals were:
1. Define the database schema and create the necessary tables.
2. Load sample data into the database.
3. Demonstrate simple and complex queries to retrieve and analyze data.

## Accomplishments

1. **Database Schema Definition**:
   - Created the Entity-Relationship Diagram (ERD) for the database.
   - Defined and created the tables: `Users`, `Categories`, `PaymentType`, `Place`, `Emotions`, and `Expenses`.

2. **Data Loading**:
   - Prepared CSV files for all entities.
   - Successfully loaded data into the MySQL tables using `LOAD DATA INFILE` commands.

3. **Query Demonstration**:
   - Executed several simple and complex queries to retrieve and analyze data.
   - Simple Queries:
     - Retrieve all users.
     - Retrieve all categories.
     - Retrieve all expenses for a specific user.
   - Complex Queries:
     - Total expenses by category.
     - Average expense amount by payment method.

## Evidence

### Database Schema
- Screenshot or code snippet of the ERD.
- SQL script (`schema.sql`) used to create the tables.

### Data Loading
- Screenshots of the loaded data in MySQL Workbench.
- CSV files used for data loading.

### Query Results
- Screenshots or output of the queries executed.

# Planning Scope for Sprint 2

## Project Overview

The project aims to develop a Personal Expense Tracker information system backed by a MySQL database. The system will allow users to track their expenses, categorize them, and analyze spending patterns using various queries.

## Sprint 2 Goals

For Sprint 2, the primary goals are:
1. Develop and test more complex queries to retrieve and analyze data.
2. Normalize the database schema to ensure data integrity and efficiency.
3. Document the system and database design.

## Objectives and Success Criteria

1. **Complex Queries Development**:
   - **Objective**: Write and execute complex SQL queries to analyze data.
   - **Success Criteria**:
     - At least three complex queries are written and executed successfully.
     - Results of the queries are accurate and reflect the data correctly.

2. **Database Normalization**:
   - **Objective**: Normalize the database schema to the third normal form (3NF).
   - **Success Criteria**:
     - ERD is updated to reflect the normalized schema.
     - All tables are normalized without data redundancy and anomalies.

3. **System and Database Documentation**:
   - **Objective**: Document the database schema, queries, and system functionality.
   - **Success Criteria**:
     - Detailed documentation is created for the database schema.
     - Descriptions of the queries and their purposes are provided.
     - The overall system design and functionality are documented.

## Alignment with Course Competencies

1. **Data Analytics Competency**:
   - **Action**: Developing complex queries to analyze data.
   - **Outcome**: Demonstrate the ability to write advanced SQL queries to retrieve and analyze data.
   - **Module-Level Correlation**: This goal aligns with the data analytics module by applying advanced SQL techniques such as aggregation, joins, subqueries, and grouping.

2. **Data Modeling Competency**:
   - **Action**: Normalizing the database schema.
   - **Outcome**: Show proficiency in database normalization techniques to ensure data integrity and efficiency.
   - **Module-Level Correlation**: This goal aligns with the data modeling module by applying normalization rules (1NF, 2NF, 3NF) to create an optimized and efficient database structure.

3. **Documentation Competency**:
   - **Action**: Creating detailed documentation for the system and database.
   - **Outcome**: Demonstrate the ability to document the database design, queries, and system functionality.
   - **Module-Level Correlation**: This goal supports the comprehensive understanding and communication of database design and functionality, which is essential for both data analytics and data modeling modules.

## Development Plan

1. **Week 1**:
   - Write and test complex SQL queries for data analysis.
   - Verify the correctness of the queries and data.
   - Normalize the database schema and update the ERD.

2. **Week 2**:
   - Implement the changes in the MySQL database.
   - Create detailed documentation for the database schema, queries, and system functionality.
   - Review and finalize the documentation.

## Risk Management

1. **Risk**: Errors in complex queries.
   - **Mitigation**: Thoroughly test all queries with different scenarios and data sets to ensure accuracy.

2. **Risk**: Issues during database normalization.
   - **Mitigation**: Review normalization rules and techniques, and validate changes with sample data.

3. **Risk**: Incomplete or unclear documentation.
   - **Mitigation**: Review and revise documentation to ensure completeness and clarity.

## Deliverables

1. **Complex Queries**: SQL scripts for complex queries with explanations.
2. **Normalized Schema**: Updated ERD and normalized database schema.
3. **Documentation**: Detailed documentation of the database schema, queries, and system functionality.
