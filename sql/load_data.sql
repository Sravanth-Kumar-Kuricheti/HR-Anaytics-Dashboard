-- load_data.sql
-- Make sure to start MySQL with local_infile enabled:
-- mysql --local-infile=1 -u root -p

USE hr_analytics;

-- Adjust the file path below to your local CSV path.
-- Windows example: 'C:/Users/srava/HR_Analytics_Dashboard/data/HR_Employee_Attrition.csv'
-- Linux example: '/home/youruser/HR_Analytics_Dashboard/data/HR_Employee_Attrition.csv'

LOAD DATA LOCAL INFILE 'C:/Users/srava/HR_Analytics_Dashboard/data/HR_Employee_Attrition.csv'
INTO TABLE employee_data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  Age, Attrition, BusinessTravel, DailyRate, Department, DistanceFromHome, Education,
  EducationField, EmployeeCount, EmployeeNumber, EnvironmentSatisfaction, Gender,
  HourlyRate, JobInvolvement, JobLevel, JobRole, JobSatisfaction, MaritalStatus,
  MonthlyIncome, MonthlyRate, NumCompaniesWorked, Over18, OverTime, PercentSalaryHike,
  PerformanceRating, RelationshipSatisfaction, StandardHours, StockOptionLevel,
  TotalWorkingYears, TrainingTimesLastYear, WorkLifeBalance, YearsAtCompany,
  YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager
);
