# Library-Management-System


A SQL-based Library Management System designed to manage core operations such as book tracking, customer information, employee details, and issue/return status of books. This project provides a simple yet powerful relational database structure along with SQL queries for efficient data retrieval.

##  Technologies Used

- MySQL
- SQL (DDL & DML)

##  Database Schema

The database consists of **6 core tables**:

### 1. `Branch`
| Column        | Type         | Description                    |
|---------------|--------------|--------------------------------|
| Branch_no     | INT (PK)     | Unique ID for the branch       |
| Manager_Id    | INT          | Employee ID managing the branch|
| Branch_address| VARCHAR(255) | Address of the branch          |
| Contact_no    | VARCHAR(15)  | Contact number                 |

### 2. `Employee`
| Column     | Type           | Description                    |
|------------|----------------|--------------------------------|
| Emp_Id     | INT (PK)       | Unique employee ID             |
| Emp_name   | VARCHAR(100)   | Name of the employee           |
| Position   | VARCHAR(100)   | Job position                   |
| Salary     | DECIMAL(10,2)  | Salary of the employee         |
| Branch_no  | INT (FK)       | Refers `Branch_no` in Branch   |

### 3. `Books`
| Column       | Type           | Description                   |
|--------------|----------------|-------------------------------|
| ISBN         | VARCHAR(20)(PK)| Unique book ID                |
| Book_title   | VARCHAR(255)   | Title of the book             |
| Category     | VARCHAR(100)   | Genre/category                |
| Rental_Price | DECIMAL(6,2)   | Rent price                    |
| Status       | VARCHAR(5)     | 'Yes' if available            |
| Author       | VARCHAR(100)   | Book author                   |
| Publisher    | VARCHAR(100)   | Publishing company            |

### 4. `Customer`
| Column         | Type         | Description                  |
|----------------|--------------|------------------------------|
| Customer_Id    | INT (PK)     | Unique customer ID           |
| Customer_name  | VARCHAR(100) | Name of the customer         |
| Customer_address| VARCHAR(255)| Address                      |
| Reg_date       | DATE         | Registration date            |

### 5. `IssueStatus`
| Column         | Type         | Description                  |
|----------------|--------------|------------------------------|
| Issue_Id       | INT (PK)     | Unique issue ID              |
| Issued_cust    | INT (FK)     | Refers `Customer_Id`         |
| Issued_book_name| VARCHAR(255)| Title of the issued book     |
| Issue_date     | DATE         | Date when book was issued    |
| Isbn_book      | VARCHAR(20)(FK)| Refers `ISBN` in Books     |

### 6. `ReturnStatus`
| Column         | Type         | Description                  |
|----------------|--------------|------------------------------|
| Return_Id      | INT (PK)     | Unique return ID             |
| Return_cust    | INT          | Customer returning the book  |
| Return_book_name| VARCHAR(255)| Title of the returned book   |
| Return_date    | DATE         | Date when book was returned  |
| Isbn_book2     | VARCHAR(20)(FK)| Refers `ISBN` in Books     |

---

##  SQL Queries

The project includes SQL queries to perform the following tasks:

- Retrieve the **book title, category, and rental price** of all **available books**.
- List **employee names** and their **salaries**, sorted in **descending order** of salary.
- Get the **book titles** and the **names of customers** who have **issued them**.
- Count the **total number of books** in each **category**.
- Display the **names and positions of employees** with **salaries above Rs. 50,000**.
- List **customers who registered before 2022-01-01** and have **not issued any books**.
- Show **branch numbers** and the **total number of employees** in each branch.
- Find **customers who issued books in June 2023**.
- Retrieve **book titles** that contain the word **“history”**.
- Display **branches with more than 5 employees** along with their **employee count**.
- Retrieve the **names of employees** who **manage branches** and their **branch addresses**.
- List **customers who issued books** with a **rental price greater than Rs. 25**.
