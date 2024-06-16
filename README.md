# Personal Expense Tracker

## Project Overview
The Personal Expense Tracker is a web application that allows users to keep track of their expenses. Users can register, log in, and manage their expenses by adding, updating, and deleting expense records. Expenses are categorized for better organization and users can view their spending summaries.

## Setup Instructions

1. **Clone the repository**:
git clone <repository_url>
cd expense_tracker


2. **Set up a virtual environment**:
py -m venv venv
source venv/bin/activate # On Windows, use venv\Scripts\activate


3. **Install dependencies**:
pip install -r requirements.txt


4. **Configure the database**:
- Ensure you have MySQL installed and running.
- Create a database named `expense_tracker`.
- Update the `SQLALCHEMY_DATABASE_URI` in `config.py` with your MySQL username and password.

5. **Initialize the database**:
- Run the SQL script `schema.sql` to create the necessary tables:
  ```bash
  mysql -u your_username -p expense_tracker < schema.sql
  ```
- Alternatively, you can run the script from a MySQL client:
  ```sql
  SOURCE /path/to/schema.sql;
  ```

6. **Run the application**:
flask run


7. **Access the application**:
Open your browser and go to `http://localhost:5000`.

## File Descriptions

- `app.py`: The main Flask application file that contains route definitions and request handling.
- `config.py`: Configuration file for setting up the Flask application.
- `models.py`: Database models for users, expenses, and categories.
- `requirements.txt`: List of dependencies required for the project.
- `schema.sql`: SQL script to set up the database schema.
- `templates/`: Directory containing HTML templates for rendering web pages.

## Features

- User registration and login
- Adding, updating, and deleting expenses
- Categorizing expenses
- Viewing spending summaries

## Future Improvements

- Implementing advanced features such as monthly reports and data visualization.
- Adding more complex SQL queries for better data analysis.
