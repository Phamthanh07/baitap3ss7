CREATE DATABASE MarketingDB;
USE MarketingDB;
CREATE TABLE Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    created_at DATE
);
CREATE TABLE Payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount DECIMAL(12,2),
    paid_at DATE,
    FOREIGN KEY (student_id) REFERENCES Students(id)
);
INSERT INTO Students (full_name, email, created_at)
VALUES
('Nguyen Van A', 'a@gmail.com', '2023-01-10'),
('Tran Thi B', 'b@gmail.com', '2023-05-20'),
('Le Van C', 'c@gmail.com', '2024-02-15');

INSERT INTO Payments (student_id, amount, paid_at)
VALUES
(1, 500000, '2024-03-10'),
(3, 300000, '2023-12-25');
SELECT *
FROM Students
WHERE id NOT IN (
    SELECT student_id
    FROM Payments
    WHERE YEAR(paid_at) = 2024
);



