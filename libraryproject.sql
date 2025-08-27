DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
            branch_id VARCHAR(10) PRIMARY KEY,
            manager_id VARCHAR(10),
            branch_address VARCHAR(30),
            contact_no VARCHAR(15)
);


-- Create table "Employee"
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
            emp_id VARCHAR(10) PRIMARY KEY,
            emp_name VARCHAR(30),
            position VARCHAR(30),
            salary DECIMAL(10,2),
            branch_id VARCHAR(10),
            FOREIGN KEY (branch_id) REFERENCES  branch(branch_id)
);


-- Create table "Members"
DROP TABLE IF EXISTS members;
CREATE TABLE members
(
            member_id VARCHAR(10) PRIMARY KEY,
            member_name VARCHAR(30),
            member_address VARCHAR(30),
            reg_date DATE
);



-- Create table "Books"
DROP TABLE IF EXISTS books;
CREATE TABLE books
(
            isbn VARCHAR(50) PRIMARY KEY,
            book_title VARCHAR(80),
            category VARCHAR(30),
            rental_price DECIMAL(10,2),
            status VARCHAR(10),
            author VARCHAR(30),
            publisher VARCHAR(30)
);



-- Create table "IssueStatus"
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
            issued_id VARCHAR(10) PRIMARY KEY,
            issued_member_id VARCHAR(30),
            issued_book_name VARCHAR(80),
            issued_date DATE,
            issued_book_isbn VARCHAR(50),
            issued_emp_id VARCHAR(10),
            FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
            FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
            FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn) 
);



-- Create table "ReturnStatus"
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
            return_id VARCHAR(10) PRIMARY KEY,
            issued_id VARCHAR(30),
            return_book_name VARCHAR(80),
            return_date DATE,
            return_book_isbn VARCHAR(50),
            FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);
--queries to be run
--1. Create a New Book Record
-- Objective: Add a new book to the books table with the provided details.

--2. Update an Existing Member's Address
-- Objective: Change the address of a member with a specific member_id.

--3. Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

--4. Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

--5. List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

--6. Create Summary Tables
-- Objective: Use CTAS to generate a new table based on query results, summarizing each book and its total book_issued_cnt.

--7. Retrieve All Books in a Specific Category
-- Objective: Select all books that belong to a specific category.

--8. Find Total Rental Income by Category
-- Objective: Calculate the total rental income and the count of books issued for each book category.

--9. List Members Who Registered in the Last 180 Days
-- Objective: Find all members who registered within the last 180 days.

--10. List Employees with Their Branch Manager's Name and their branch details
-- Objective: Join tables to list employees, their branch details, and their respective manager's name.

--11. Create a Table of Books with Rental Price Above a Certain Threshold
-- Objective: Create a new table containing all books with a rental price greater than 7.00.

--12. Retrieve the List of Books Not Yet Returned
-- Objective: Find all books that have been issued but do not have a corresponding return record.

--13. Identify Members with Overdue Books
-- Objective: List members who have overdue books (not returned after 30 days).

--14. Branch Performance Report
-- Objective: Create a report table that summarizes the performance of each branch.

--15. CTAS: Create a Table of Active Members
-- Objective: Create a new table that includes all members who have issued a book in the last two months.

--16. Find Employees with the Most Book Issues Processed
-- Objective: Determine which employees have processed the most book issues.

