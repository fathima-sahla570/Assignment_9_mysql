Stored procedures are precompiled SQL statements that are stored in the database and can be executed as a single unit.
They help in improving performance, ensuring consistency, and reusability. In this assignment, we will explore the use of stored procedures to perform various operations on the Worker table, 
such as adding new records, retrieving and updating specific fields, and calculating statistics.

The Worker table structure is as follows:

Worker_Id (INT): Unique identifier for each worker.
FirstName (CHAR(25)): First name of the worker.
LastName (CHAR(25)): Last name of the worker.
Salary (INT(15)): Salary of the worker.
JoiningDate (DATETIME): The date the worker joined.
Department (CHAR(25)): The department where the worker is employed.
The tasks in this assignment will help us understand how to define, use, and invoke stored procedures for different database operations.

Objectives:
Create a Record: Write a stored procedure to add a new worker to the table using input parameters for all fields.
Retrieve Salary: Write a stored procedure to fetch the salary of a worker using their Worker_Id and return it via an OUT parameter.
Update Department: Write a stored procedure to update the department of a worker based on their Worker_Id.
Count Workers in Department: Write a stored procedure to calculate the total number of workers in a given department and return it via an OUT parameter.
Average Salary in Department: Write a stored procedure to compute the average salary of workers in a specific department and return it via an OUT parameter.
Each task includes the definition of the stored procedure and an example procedure call to demonstrate its usage.

These exercises will deepen your understanding of working with stored procedures and managing database operations efficiently.
