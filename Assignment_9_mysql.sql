-- Step 1: Create the Worker Table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY AUTO_INCREMENT,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)

);
select*from worker;
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 
(1, 'John', 'Doe', 50000, '2020-01-15', 'HR'),
(2, 'Jane', 'Smith', 60000, '2019-03-22', 'IT'),
(3, 'Sam', 'Brown', 45000, '2021-06-10', 'Finance'),
(4, 'Alice', 'Jones', 70000, '2018-11-02', 'IT'),
(5, 'Mike', 'Taylor', 40000, '2022-09-05', 'HR');

-- Step 2: Stored Procedure to Add a New Record
DELIMITER $$
CREATE PROCEDURE Add_Worker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker  (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;
CALL Add_Worker(6, 'Emma', 'Wilson', 55000, '2023-01-01', 'Finance');
-- Retrieve Salary Based on Worker ID
DELIMITER $$

CREATE PROCEDURE Get_SalaryById(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary 
    FROM Worker 
    WHERE Worker_Id = p_Worker_Id;
END $$
DELIMITER ;
CALL Get_SalaryById(2, @worker_salary);
SELECT @worker_salary AS WorkerSalary;
-- 3. Update Worker Department
DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker 
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END $$
DELIMITER ;
CALL UpdateWorkerDepartment(3, 'Marketing');
-- 4. Count Workers in a Department
DELIMITER $$

CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount 
    FROM Worker 
    WHERE Department = p_Department;
END $$

DELIMITER ;
CALL GetWorkerCount('IT', @worker_count);
SELECT @worker_count AS WorkerCount;
-- 5. Calculate Average Salary in a Department
DELIMITER $$

CREATE PROCEDURE GetAverageSalary(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary 
    FROM Worker 
    WHERE Department = p_Department;
END $$

DELIMITER ;
CALL GetAverageSalary('HR', @avg_salary);
SELECT @avg_salary AS AverageSalary;
SELECT * FROM Worker;
