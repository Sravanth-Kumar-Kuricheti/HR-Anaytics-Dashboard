# HR Analytics Dashboard

## Overview
An interactive HR analytics project that ingests HR employee data, stores it in MySQL, performs SQL analyses, and visualizes insights in Tableau. Useful metrics: attrition rate, job satisfaction, performance, income distribution and workforce demographics.

## Folder Structure
HR_Analytics_Dashboard/
├── README.md
├── data/
│ └── HR_Employee_Attrition.csv
├── sql/
│ ├── create_table.sql
│ ├── load_data.sql
│ └── analysis_queries.sql
├── automation/
│ └── monthly_update.py
├── notebooks/
│ └── hr_data_analysis.py
├── dashboard/
│ └── HR_Analytics_Dashboard.twbx (Tableau workbook - export after building)
├── images/
│ └── dashboard_preview.png
└── requirements.txt


## Prerequisites
- MySQL Server (8.x recommended)
- Python 3.8+
- Tableau Desktop or Tableau Public
- Git

## Quick Setup (Windows example)
1. Start MySQL server and ensure `local_infile` is enabled. E.g. start MySQL with:
