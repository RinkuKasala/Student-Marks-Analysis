-- ============================================
-- STUDENT MARKS ANALYSIS SQL PROJECT
-- Project: Academic Performance Analytics
-- Author: Rinku Kasala
-- GitHub: https://github.com/RinkuKasala/Student-Marks-Analysis---SQL-Project
-- ============================================

-- ============================================
-- SECTION 1: DATABASE AND TABLE CREATION
-- ============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS student_performance_db;
USE student_performance_db;

-- Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    enrollment_date DATE NOT NULL,
    class VARCHAR(20) NOT NULL,
    section VARCHAR(5) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50)
);

-- Subjects Table
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100) NOT NULL,
    subject_code VARCHAR(20) UNIQUE NOT NULL,
    max_marks INT NOT NULL DEFAULT 100,
    pass_marks INT NOT NULL DEFAULT 40
);

-- Marks Table
CREATE TABLE marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    exam_type ENUM('Mid-Term', 'Final', 'Quiz', 'Assignment') NOT NULL,
    marks_obtained DECIMAL(5,2) NOT NULL,
    exam_date DATE NOT NULL,
    academic_year VARCHAR(10) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id) ON DELETE CASCADE
);

-- Teachers Table
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(100) NOT NULL,
    subject_id INT NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- Attendance Table
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Late', 'On Leave') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

-- ============================================
-- SECTION 2: SAMPLE DATA INSERTION
-- ============================================

-- Insert Students
INSERT INTO students (student_name, gender, date_of_birth, enrollment_date, class, section, city, state) VALUES
('Rahul Sharma', 'Male', '2005-03-15', '2020-04-01', '12th', 'A', 'Mumbai', 'Maharashtra'),
('Priya Singh', 'Female', '2005-07-22', '2020-04-01', '12th', 'A', 'Delhi', 'Delhi'),
('Amit Kumar', 'Male', '2005-01-10', '2020-04-01', '12th', 'B', 'Bangalore', 'Karnataka'),
('Sneha Patel', 'Female', '2005-11-30', '2020-04-01', '12th', 'A', 'Ahmedabad', 'Gujarat'),
('Arjun Reddy', 'Male', '2005-05-18', '2020-04-01', '12th', 'B', 'Hyderabad', 'Telangana'),
('Kavya Menon', 'Female', '2005-09-25', '2020-04-01', '11th', 'A', 'Kochi', 'Kerala'),
('Rohan Verma', 'Male', '2006-02-14', '2021-04-01', '11th', 'A', 'Pune', 'Maharashtra'),
('Anjali Gupta', 'Female', '2006-06-08', '2021-04-01', '11th', 'B', 'Kolkata', 'West Bengal'),
('Vikram Singh', 'Male', '2006-12-20', '2021-04-01', '11th', 'B', 'Jaipur', 'Rajasthan'),
('Meera Krishnan', 'Female', '2006-04-03', '2021-04-01', '10th', 'A', 'Chennai', 'Tamil Nadu'),
('Karan Mehta', 'Male', '2007-08-17', '2022-04-01', '10th', 'A', 'Surat', 'Gujarat'),
('Pooja Nair', 'Female', '2007-10-11', '2022-04-01', '10th', 'B', 'Thiruvananthapuram', 'Kerala');

-- Insert Subjects
INSERT INTO subjects (subject_name, subject_code, max_marks, pass_marks) VALUES
('Mathematics', 'MATH101', 100, 40),
('Physics', 'PHY101', 100, 40),
('Chemistry', 'CHEM101', 100, 40),
('English', 'ENG101', 100, 40),
('Computer Science', 'CS101', 100, 40),
('Biology', 'BIO101', 100, 40);

-- Insert Marks (Final Exam - Academic Year 2023-24)
INSERT INTO marks (student_id, subject_id, exam_type, marks_obtained, exam_date, academic_year) VALUES
-- Rahul Sharma (Student 1)
(1, 1, 'Final', 92, '2024-03-15', '2023-24'),
(1, 2, 'Final', 88, '2024-03-16', '2023-24'),
(1, 3, 'Final', 85, '2024-03-17', '2023-24'),
(1, 4, 'Final', 78, '2024-03-18', '2023-24'),
(1, 5, 'Final', 95, '2024-03-19', '2023-24'),

-- Priya Singh (Student 2)
(2, 1, 'Final', 95, '2024-03-15', '2023-24'),
(2, 2, 'Final', 90, '2024-03-16', '2023-24'),
(2, 3, 'Final', 88, '2024-03-17', '2023-24'),
(2, 4, 'Final', 92, '2024-03-18', '2023-24'),
(2, 5, 'Final', 89, '2024-03-19', '2023-24'),

-- Amit Kumar (Student 3)
(3, 1, 'Final', 72, '2024-03-15', '2023-24'),
(3, 2, 'Final', 68, '2024-03-16', '2023-24'),
(3, 3, 'Final', 75, '2024-03-17', '2023-24'),
(3, 4, 'Final', 70, '2024-03-18', '2023-24'),
(3, 5, 'Final', 78, '2024-03-19', '2023-24'),

-- Sneha Patel (Student 4)
(4, 1, 'Final', 85, '2024-03-15', '2023-24'),
(4, 2, 'Final', 82, '2024-03-16', '2023-24'),
(4, 3, 'Final', 88, '2024-03-17', '2023-24'),
(4, 4, 'Final', 90, '2024-03-18', '2023-24'),
(4, 6, 'Final', 87, '2024-03-19', '2023-24'),

-- Arjun Reddy (Student 5)
(5, 1, 'Final', 38, '2024-03-15', '2023-24'),
(5, 2, 'Final', 42, '2024-03-16', '2023-24'),
(5, 3, 'Final', 45, '2024-03-17', '2023-24'),
(5, 4, 'Final', 55, '2024-03-18', '2023-24'),
(5, 5, 'Final', 48, '2024-03-19', '2023-24'),

-- Add more marks for other students...
(6, 1, 'Final', 88, '2024-03-15', '2023-24'),
(6, 2, 'Final', 85, '2024-03-16', '2023-24'),
(6, 3, 'Final', 90, '2024-03-17', '2023-24'),
(6, 4, 'Final', 87, '2024-03-18', '2023-24'),
(6, 6, 'Final', 92, '2024-03-19', '2023-24'),

(7, 1, 'Final', 65, '2024-03-15', '2023-24'),
(7, 2, 'Final', 70, '2024-03-16', '2023-24'),
(7, 3, 'Final', 68, '2024-03-17', '2023-24'),
(7, 4, 'Final', 72, '2024-03-18', '2023-24'),
(7, 5, 'Final', 75, '2024-03-19', '2023-24');

-- ============================================
-- SECTION 3: BASIC ANALYSIS QUERIES
-- ============================================

-- Query 1: Student-wise Total and Average Marks
SELECT 
    s.student_id,
    s.student_name,
    s.class,
    s.section,
    COUNT(m.mark_id) AS total_subjects,
    SUM(m.marks_obtained) AS total_marks,
    ROUND(AVG(m.marks_obtained), 2) AS average_marks,
    CASE 
        WHEN AVG(m.marks_obtained) >= 90 THEN 'A+'
        WHEN AVG(m.marks_obtained) >= 80 THEN 'A'
        WHEN AVG(m.marks_obtained) >= 70 THEN 'B'
        WHEN AVG(m.marks_obtained) >= 60 THEN 'C'
        WHEN AVG(m.marks_obtained) >= 40 THEN 'D'
        ELSE 'F'
    END AS grade
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24'
GROUP BY s.student_id, s.student_name, s.class, s.section
ORDER BY average_marks DESC;

-- Query 2: Subject-wise Performance Analysis
SELECT 
    sub.subject_name,
    sub.subject_code,
    COUNT(m.mark_id) AS total_students,
    ROUND(AVG(m.marks_obtained), 2) AS average_marks,
    MAX(m.marks_obtained) AS highest_marks,
    MIN(m.marks_obtained) AS lowest_marks,
    SUM(CASE WHEN m.marks_obtained >= sub.pass_marks THEN 1 ELSE 0 END) AS passed_count,
    SUM(CASE WHEN m.marks_obtained < sub.pass_marks THEN 1 ELSE 0 END) AS failed_count,
    ROUND((SUM(CASE WHEN m.marks_obtained >= sub.pass_marks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.mark_id)), 2) AS pass_percentage
FROM subjects sub
LEFT JOIN marks m ON sub.subject_id = m.subject_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24'
GROUP BY sub.subject_id, sub.subject_name, sub.subject_code
ORDER BY average_marks DESC;

-- Query 3: Class-wise Performance
SELECT 
    s.class,
    COUNT(DISTINCT s.student_id) AS total_students,
    ROUND(AVG(m.marks_obtained), 2) AS class_average,
    MAX(m.marks_obtained) AS highest_score,
    MIN(m.marks_obtained) AS lowest_score
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24'
GROUP BY s.class
ORDER BY class_average DESC;

-- ============================================
-- SECTION 4: ADVANCED ANALYSIS QUERIES
-- ============================================

-- Query 4: Top 5 Performers
SELECT 
    s.student_name,
    s.class,
    s.section,
    ROUND(AVG(m.marks_obtained), 2) AS average_marks,
    RANK() OVER (ORDER BY AVG(m.marks_obtained) DESC) AS rank_position
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24'
GROUP BY s.student_id, s.student_name, s.class, s.section
ORDER BY average_marks DESC
LIMIT 5;

-- Query 5: Students Who Failed in Any Subject
SELECT 
    s.student_name,
    s.class,
    sub.subject_name,
    m.marks_obtained,
    sub.pass_marks,
    (sub.pass_marks - m.marks_obtained) AS marks_deficit
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id
WHERE m.marks_obtained < sub.pass_marks 
    AND m.exam_type = 'Final' 
    AND m.academic_year = '2023-24'
ORDER BY s.student_name, sub.subject_name;

-- Query 6: Gender-wise Performance Comparison
SELECT 
    s.gender,
    COUNT(DISTINCT s.student_id) AS total_students,
    ROUND(AVG(m.marks_obtained), 2) AS average_marks,
    MAX(m.marks_obtained) AS highest_marks,
    MIN(m.marks_obtained) AS lowest_marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24'
GROUP BY s.gender;

-- Query 7: State-wise Performance Analysis
SELECT 
    s.state,
    COUNT(DISTINCT s.student_id) AS total_students,
    ROUND(AVG(m.marks_obtained), 2) AS average_marks,
    RANK() OVER (ORDER BY AVG(m.marks_obtained) DESC) AS state_rank
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24'
GROUP BY s.state
ORDER BY average_marks DESC;

-- Query 8: Students Performance Trend (Pass/Fail Analysis)
SELECT 
    s.student_id,
    s.student_name,
    s.class,
    COUNT(m.mark_id) AS total_subjects,
    SUM(CASE WHEN m.marks_obtained >= sub.pass_marks THEN 1 ELSE 0 END) AS subjects_passed,
    SUM(CASE WHEN m.marks_obtained < sub.pass_marks THEN 1 ELSE 0 END) AS subjects_failed,
    CASE 
        WHEN SUM(CASE WHEN m.marks_obtained < sub.pass_marks THEN 1 ELSE 0 END) = 0 THEN 'PASS'
        ELSE 'FAIL'
    END AS overall_result
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24'
GROUP BY s.student_id, s.student_name, s.class
ORDER BY overall_result DESC, subjects_passed DESC;

-- Query 9: Subject Difficulty Analysis (Based on Average Scores)
SELECT 
    sub.subject_name,
    ROUND(AVG(m.marks_obtained), 2) AS average_marks,
    CASE 
        WHEN AVG(m.marks_obtained) >= 80 THEN 'Easy'
        WHEN AVG(m.marks_obtained) >= 60 THEN 'Moderate'
        WHEN AVG(m.marks_obtained) >= 40 THEN 'Difficult'
        ELSE 'Very Difficult'
    END AS difficulty_level
FROM subjects sub
JOIN marks m ON sub.subject_id = m.subject_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24'
GROUP BY sub.subject_id, sub.subject_name
ORDER BY average_marks DESC;

-- Query 10: Students Who Need Improvement (Below 60% Average)
SELECT 
    s.student_name,
    s.class,
    s.section,
    ROUND(AVG(m.marks_obtained), 2) AS average_marks,
    GROUP_CONCAT(
        CONCAT(sub.subject_name, ': ', m.marks_obtained) 
        ORDER BY m.marks_obtained ASC 
        SEPARATOR ', '
    ) AS subject_scores
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24'
GROUP BY s.student_id, s.student_name, s.class, s.section
HAVING AVG(m.marks_obtained) < 60
ORDER BY average_marks ASC;

-- ============================================
-- SECTION 5: PERFORMANCE REPORTS & VIEWS
-- ============================================

-- Create View: Student Performance Dashboard
CREATE OR REPLACE VIEW vw_student_performance AS
SELECT 
    s.student_id,
    s.student_name,
    s.gender,
    s.class,
    s.section,
    s.state,
    COUNT(m.mark_id) AS total_subjects,
    ROUND(AVG(m.marks_obtained), 2) AS average_marks,
    MAX(m.marks_obtained) AS best_score,
    MIN(m.marks_obtained) AS lowest_score,
    SUM(CASE WHEN m.marks_obtained >= sub.pass_marks THEN 1 ELSE 0 END) AS subjects_passed,
    CASE 
        WHEN AVG(m.marks_obtained) >= 90 THEN 'A+ (Excellent)'
        WHEN AVG(m.marks_obtained) >= 80 THEN 'A (Very Good)'
        WHEN AVG(m.marks_obtained) >= 70 THEN 'B (Good)'
        WHEN AVG(m.marks_obtained) >= 60 THEN 'C (Average)'
        WHEN AVG(m.marks_obtained) >= 40 THEN 'D (Below Average)'
        ELSE 'F (Fail)'
    END AS grade
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24'
GROUP BY s.student_id, s.student_name, s.gender, s.class, s.section, s.state;

-- Query the View
SELECT * FROM vw_student_performance ORDER BY average_marks DESC;

-- ============================================
-- SECTION 6: INSIGHTS & KEY METRICS
-- ============================================

-- Overall School Performance Summary
SELECT 
    COUNT(DISTINCT s.student_id) AS total_students,
    COUNT(DISTINCT sub.subject_id) AS total_subjects,
    ROUND(AVG(m.marks_obtained), 2) AS overall_average,
    SUM(CASE WHEN m.marks_obtained >= sub.pass_marks THEN 1 ELSE 0 END) AS total_passes,
    SUM(CASE WHEN m.marks_obtained < sub.pass_marks THEN 1 ELSE 0 END) AS total_failures,
    ROUND((SUM(CASE WHEN m.marks_obtained >= sub.pass_marks THEN 1 ELSE 0 END) * 100.0 / COUNT(m.mark_id)), 2) AS overall_pass_percentage
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id
WHERE m.exam_type = 'Final' AND m.academic_year = '2023-24';

-- ============================================
-- END OF SQL SCRIPT
-- ============================================
