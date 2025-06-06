CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(6, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'MG Road, Mumbai', '9876543210'),
(2, 102, 'Brigade Road, Bangalore', '9123456789'),
(3, 103, 'Park Street, Kolkata', '9988776655');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(101, 'Anil Mehta', 'Manager', 75000.00, 1),
(102, 'Sneha Rao', 'Manager', 72000.00, 2),
(103, 'Rajeev Nair', 'Manager', 71000.00, 3),
(104, 'Priya Das', 'Librarian', 48000.00, 1),
(105, 'Karan Singh', 'Assistant', 35000.00, 2),
(106, 'Fatima Khan', 'Assistant', 37000.00, 3),
(107, 'Vikram Joshi', 'Librarian', 52000.00, 1),
(108, 'Neel Roy', 'Technician', 39000.00, 2),
(109, 'Sara Ali', 'Assistant', 30000.00, 3),
(110, 'Ajay Dev', 'Security', 25000.00, 1);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('ISBN001', 'The History of India', 'History', 30.00, 'yes', 'Romila Thapar', 'Penguin'),
('ISBN002', 'Introduction to Algorithms', 'Computer Science', 45.00, 'no', 'Cormen', 'MIT Press'),
('ISBN003', 'The Great Gatsby', 'Fiction', 20.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('ISBN004', 'A Brief History of Time', 'Science', 35.00, 'no', 'Stephen Hawking', 'Bantam'),
('ISBN005', 'Think and Grow Rich', 'Self-help', 25.00, 'yes', 'Napoleon Hill', 'Simon & Schuster'),
('ISBN006', 'Wings of Fire', 'Autobiography', 18.00, 'yes', 'APJ Abdul Kalam', 'Universities Press'),
('ISBN007', 'Sapiens: A Brief History of Humankind', 'History', 40.00, 'no', 'Yuval Noah Harari', 'Harper'),
('ISBN008', 'Clean Code', 'Computer Science', 50.00, 'yes', 'Robert C. Martin', 'Prentice Hall'),
('ISBN009', 'To Kill a Mockingbird', 'Fiction', 22.00, 'yes', 'Harper Lee', 'J.B. Lippincott'),
('ISBN010', 'Zero to One', 'Business', 28.00, 'no', 'Peter Thiel', 'Crown Publishing');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(201, 'Priya Das', 'Mumbai', '2021-12-30'),
(202, 'Arjun Kapoor', 'Delhi', '2022-02-15'),
(203, 'Neha Verma', 'Bangalore', '2023-01-10'),
(204, 'Ishaan Khan', 'Chennai', '2023-06-05'),
(205, 'Meera Singh', 'Kolkata', '2021-10-20'),
(206, 'Ananya Rao', 'Hyderabad', '2022-05-18'),
(207, 'Rohan Gupta', 'Pune', '2023-06-10'),
(208, 'Kavya Nair', 'Cochin', '2023-03-03'),
(209, 'Dev Sharma', 'Ahmedabad', '2022-12-22'),
(210, 'Simran Paul', 'Chandigarh', '2021-11-29');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(301, 202, 'Introduction to Algorithms', '2023-05-20', 'ISBN002'),
(302, 203, 'The Great Gatsby', '2023-06-12', 'ISBN003'),
(303, 204, 'Think and Grow Rich', '2023-06-18', 'ISBN005'),
(304, 207, 'Wings of Fire', '2023-06-25', 'ISBN006'),
(305, 208, 'Clean Code', '2023-03-15', 'ISBN008'),
(306, 209, 'To Kill a Mockingbird', '2023-04-20', 'ISBN009'),
(307, 210, 'Zero to One', '2023-05-05', 'ISBN010'),
(308, 202, 'Sapiens', '2023-06-01', 'ISBN007'),
(309, 206, 'The History of India', '2023-05-10', 'ISBN001'),
(310, 203, 'A Brief History of Time', '2023-06-30', 'ISBN004');

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(401, 202, 'Introduction to Algorithms', '2023-06-01', 'ISBN002'),
(402, 203, 'The Great Gatsby', '2023-07-01', 'ISBN003'),
(403, 204, 'Think and Grow Rich', '2023-07-05', 'ISBN005'),
(404, 207, 'Wings of Fire', '2023-07-08', 'ISBN006'),
(405, 208, 'Clean Code', '2023-04-01', 'ISBN008');

-- QUERIES

-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT i.Issued_book_name, c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS TotalBooks FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS EmployeeCount FROM Employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;

-- 9. Retrieve book_title from book table containing history.
SELECT Book_title FROM Books WHERE Book_title LIKE '%history%';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS EmpCount
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Emp_Id = b.Manager_Id;

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;
