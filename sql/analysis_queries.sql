-- analysis_queries.sql
USE hr_analytics;

-- 1. Basic counts
SELECT COUNT(*) AS total_employees FROM employee_data;

-- 2. Attrition counts and rate by Department
SELECT Department,
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS left_count,
       ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS attrition_rate_pct
FROM employee_data
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

-- 3. Attrition by Gender
SELECT Gender,
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS left_count,
       ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS attrition_rate_pct
FROM employee_data
GROUP BY Gender;

-- 4. Average monthly income by JobRole
SELECT JobRole, ROUND(AVG(MonthlyIncome),2) AS avg_monthly_income, COUNT(*) AS num
FROM employee_data
GROUP BY JobRole
ORDER BY avg_monthly_income DESC;

-- 5. JobSatisfaction distribution
SELECT JobSatisfaction, COUNT(*) AS cnt
FROM employee_data
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- 6. Age vs Average PerformanceRating
SELECT Age, ROUND(AVG(PerformanceRating),2) AS avg_perf, COUNT(*) AS cnt
FROM employee_data
GROUP BY Age
ORDER BY Age;

-- 7. Correlation-style aggregates: YearsAtCompany vs Attrition rate
SELECT YearsAtCompany,
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS left_count,
       ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS attrition_rate
FROM employee_data
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;
