from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):
    user_id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)

class Category(db.Model):
    category_id = db.Column(db.Integer, primary_key=True)
    category_name = db.Column(db.String(80), unique=True, nullable=False)

class Expense(db.Model):
    expense_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.user_id'), nullable=False)
    amount = db.Column(db.Float, nullable=False)
    category_id = db.Column(db.Integer, db.ForeignKey('category.category_id'), nullable=False)
    description = db.Column(db.String(200))
    date = db.Column(db.Date, nullable=False)
    user = db.relationship('User', backref=db.backref('expenses', lazy=True))
    category = db.relationship('Category', backref=db.backref('expenses', lazy=True))

class Payment(db.Model):
    payment_id = db.Column(db.Integer, primary_key=True)
    expense_id = db.Column(db.Integer, db.ForeignKey('expense.expense_id'), nullable=False)
    amount = db.Column(db.Float, nullable=False)
    date = db.Column(db.Date, nullable=False)
    expense = db.relationship('Expense', backref=db.backref('payments', lazy=True))

class Budget(db.Model):
    budget_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.user_id'), nullable=False)
    amount = db.Column(db.Float, nullable=False)
    start_date = db.Column(db.Date, nullable=False)
    end_date = db.Column(db.Date, nullable=False)
    user = db.relationship('User', backref=db.backref('budgets', lazy=True))

class RecurringExpense(db.Model):
    recurring_expense_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.user_id'), nullable=False)
    amount = db.Column(db.Float, nullable=False)
    category_id = db.Column(db.Integer, db.ForeignKey('category.category_id'), nullable=False)
    description = db.Column(db.String(200))
    interval = db.Column(db.String(50), nullable=False)
    next_due_date = db.Column(db.Date, nullable=False)
    user = db.relationship('User', backref=db.backref('recurring_expenses', lazy=True))
    category = db.relationship('Category', backref=db.backref('recurring_expenses', lazy=True))

class Tag(db.Model):
    tag_id = db.Column(db.Integer, primary_key=True)
    tag_name = db.Column(db.String(50), unique=True, nullable=False)

class ExpenseTag(db.Model):
    expense_id = db.Column(db.Integer, db.ForeignKey('expense.expense_id'), primary_key=True)
    tag_id = db.Column(db.Integer, db.ForeignKey('tag.tag_id'), primary_key=True)
    expense = db.relationship('Expense', backref=db.backref('expense_tags', lazy=True))
    tag = db.relationship('Tag', backref=db.backref('expense_tags', lazy=True))
