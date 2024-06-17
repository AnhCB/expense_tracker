# BCNF Explanation for ERD Diagram

Your ERD diagram appears to be in Boyce-Codd Normal Form (BCNF). Here is an explanation for each table and their relationships:

## Users Table

- **Primary Key:** user_id
- **Attributes:** username, password, email
- **Functional Dependencies:** user_id -> username, password, email
- **Explanation:** The `user_id` uniquely identifies each user, and all other attributes are fully functionally dependent on `user_id`. There are no partial or transitive dependencies, so this table is in BCNF.

## Categories Table

- **Primary Key:** category_id
- **Attributes:** category_name
- **Functional Dependencies:** category_id -> category_name
- **Explanation:** The `category_id` uniquely identifies each category. There are no partial or transitive dependencies, so this table is in BCNF.

## PaymentType Table

- **Primary Key:** payment_type_id
- **Attributes:** payment_method
- **Functional Dependencies:** payment_type_id -> payment_method
- **Explanation:** The `payment_type_id` uniquely identifies each payment method. There are no partial or transitive dependencies, so this table is in BCNF.

## Place Table

- **Primary Key:** place_id
- **Attributes:** place_name, place_type
- **Functional Dependencies:** place_id -> place_name, place_type
- **Explanation:** The `place_id` uniquely identifies each place. There are no partial or transitive dependencies, so this table is in BCNF.

## Emotions Table

- **Primary Key:** emotion_id
- **Attributes:** emotion_name
- **Functional Dependencies:** emotion_id -> emotion_name
- **Explanation:** The `emotion_id` uniquely identifies each emotion. There are no partial or transitive dependencies, so this table is in BCNF.

## Income Table

- **Primary Key:** income_id
- **Attributes:** user_id, amount, source, date
- **Functional Dependencies:** income_id -> user_id, amount, source, date
- **Explanation:** The `income_id` uniquely identifies each income entry, and all other attributes are fully functionally dependent on `income_id`. There are no partial or transitive dependencies, so this table is in BCNF.

## Expenses Table

- **Primary Key:** expense_id
- **Attributes:** user_id, amount, category_id, place_id, payment_type_id, emotion_id, description, date
- **Functional Dependencies:** expense_id -> user_id, amount, category_id, place_id, payment_type_id, emotion_id, description, date
- **Explanation:** The `expense_id` uniquely identifies each expense entry, and all other attributes are fully functionally dependent on `expense_id`. There are no partial or transitive dependencies, so this table is in BCNF.

## Summary

Each table in your ERD diagram meets the criteria for BCNF:
1. Each table is already in 3NF.
2. For every non-trivial functional dependency X -> Y, X is a superkey.

Thus, your ERD diagram is normalized and satisfies the requirements of BCNF.
