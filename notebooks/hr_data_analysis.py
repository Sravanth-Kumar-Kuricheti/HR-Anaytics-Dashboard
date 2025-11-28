# hr_data_analysis.py
# Usage: python hr_data_analysis.py
import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt
import seaborn as sns

DB_CONFIG = {
    'user': 'root',
    'password': 'root',   # change this
    'host': '127.0.0.1',
    'database': 'hr_analytics',
    'allow_local_infile': True
}

def query(sql):
    conn = mysql.connector.connect(**DB_CONFIG)
    df = pd.read_sql(sql, conn)
    conn.close()
    return df

def main():
    # 1. Attrition by Department
    sql1 = """
    SELECT Department,
           COUNT(*) AS total,
           SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS left_count,
           ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS attrition_rate
    FROM employee_data
    GROUP BY Department
    ORDER BY attrition_rate DESC;
    """
    df1 = query(sql1)
    print(df1)
    # Plot attrition rate
    plt.figure(figsize=(10,6))
    sns.barplot(y='Department', x='attrition_rate', data=df1)
    plt.xlabel('Attrition Rate (%)')
    plt.title('Attrition Rate by Department')
    plt.tight_layout()
    plt.savefig('../images/attrition_by_department.png')
    plt.close()

    # 2. Average monthly income by JobRole
    sql2 = "SELECT JobRole, ROUND(AVG(MonthlyIncome),2) AS avg_income, COUNT(*) AS num FROM employee_data GROUP BY JobRole ORDER BY avg_income DESC;"
    df2 = query(sql2)
    print(df2.head())
    plt.figure(figsize=(10,8))
    sns.barplot(y='JobRole', x='avg_income', data=df2)
    plt.xlabel('Average Monthly Income')
    plt.title('Average Income by Job Role')
    plt.tight_layout()
    plt.savefig('../images/avg_income_by_jobrole.png')
    plt.close()

    # 3. Job Satisfaction distribution
    sql3 = "SELECT JobSatisfaction, COUNT(*) AS cnt FROM employee_data GROUP BY JobSatisfaction ORDER BY JobSatisfaction;"
    df3 = query(sql3)
    print(df3)
    plt.figure(figsize=(6,4))
    sns.barplot(x='JobSatisfaction', y='cnt', data=df3)
    plt.xlabel('Job Satisfaction (1 low - 4 high)')
    plt.title('Job Satisfaction Distribution')
    plt.tight_layout()
    plt.savefig('../images/job_satisfaction_dist.png')
    plt.close()

    print("Charts saved to ../images/")

if __name__ == '__main__':
    main()
