-- ================================================
-- Data Science Salary Analysis — SQL Project
-- Author: Riyanshi Goel
-- Tool: SQLite (DB Browser)
-- ================================================

-- Query 1: View all data
SELECT * FROM jobs;

-- Query 2: Average salary by job title
SELECT job_title, ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM jobs
GROUP BY job_title
ORDER BY avg_salary DESC;

-- Query 3: Top 5 highest paying jobs
SELECT job_title, salary_year_avg
FROM jobs
ORDER BY salary_year_avg DESC
LIMIT 5;

-- Query 4: Count of jobs by country
SELECT job_country, COUNT(*) AS total_jobs
FROM jobs
GROUP BY job_country
ORDER BY total_jobs DESC;

-- Query 5: Average salary by country
SELECT job_country, ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM jobs
GROUP BY job_country
ORDER BY avg_salary DESC;

-- Query 6: Jobs where salary is above average (Subquery)
SELECT job_title, job_country, salary_year_avg
FROM jobs
WHERE salary_year_avg > (SELECT AVG(salary_year_avg) FROM jobs)
ORDER BY salary_year_avg DESC;

-- Query 7: Count of jobs by job schedule type
SELECT job_schedule_type, COUNT(*) AS total_jobs
FROM jobs
GROUP BY job_schedule_type
ORDER BY total_jobs DESC;

-- Query 8: Average salary by job schedule type
SELECT job_schedule_type, ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM jobs
GROUP BY job_schedule_type
ORDER BY avg_salary DESC;

-- Query 9: Top hiring platform by job count
SELECT job_platform, COUNT(*) AS total_jobs
FROM jobs
GROUP BY job_platform
ORDER BY total_jobs DESC;

-- Query 10: Full-time jobs in United States with salary above 100000
SELECT job_title, salary_year_avg, job_platform
FROM jobs
WHERE job_schedule_type = 'Full-time'
AND job_country = 'United States'
AND salary_year_avg > 100000
ORDER BY salary_year_avg DESC;
