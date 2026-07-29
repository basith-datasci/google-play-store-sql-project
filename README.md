# 📱 Google Play Store Data Analysis using SQL

> An end-to-end SQL data analytics project that transforms raw Google Play Store data into meaningful business insights using MySQL.

---

## 📖 Project Overview

The Google Play Store contains thousands of applications across different categories, making it an excellent dataset for exploring user behavior, app performance, pricing strategies, and market trends.

In this project, I performed a complete data analysis workflow using **MySQL**, starting from raw data profiling and cleaning, progressing through exploratory data analysis (EDA) and advanced SQL techniques, and concluding with business-driven insights and recommendations.

This project demonstrates both **technical SQL skills** and the ability to translate data into actionable business decisions.

---

## 🎯 Project Objectives

- Explore the Google Play Store dataset.
- Identify and clean data quality issues.
- Transform raw data into an analysis-ready dataset.
- Perform Exploratory Data Analysis (EDA).
- Apply advanced SQL concepts.
- Answer real-world business questions.
- Generate business insights and recommendations.

---

## 📊 Dataset Information

| Item | Details |
|------|----------|
| Dataset | Google Play Store Apps |
| Database | MySQL |
| SQL Environment | MySQL Workbench |
| Total Records | 10,840 |
| Analysis Type | End-to-End SQL Data Analysis |

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|----------|
| MySQL | Data Analysis |
| MySQL Workbench | SQL Development |
| Git | Version Control |
| GitHub | Project Portfolio |
| Markdown | Documentation |

---












## 🔄 Project Workflow

This project follows a structured data analysis process to transform raw Google Play Store data into actionable business insights.

```text
Raw Dataset
     │
     ▼
Data Profiling
     │
     ▼
Data Cleaning
     │
     ▼
Exploratory Data Analysis (EDA)
     │
     ▼
Advanced SQL Analysis
     │
     ▼
Business Analysis
     │
     ▼
Business Insights & Recommendations
```

### 📌 Phase 1: Data Profiling
- Explored the dataset structure.
- Identified missing values.
- Checked for duplicate records.
- Reviewed data quality issues.

### 📌 Phase 2: Data Cleaning
- Removed invalid records.
- Cleaned the **Installs** column.
- Converted **Price** to numeric values.
- Standardized **Size** values.
- Converted **Last Updated** to SQL date format.

### 📌 Phase 3: Exploratory Data Analysis (EDA)
- Analyzed app ratings.
- Compared free vs paid applications.
- Identified top categories by installs.
- Explored pricing trends.
- Performed descriptive statistics.

### 📌 Phase 4: Advanced SQL
Applied advanced SQL concepts including:

- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- NTILE()
- FIRST_VALUE()
- LAST_VALUE()
- LAG()
- LEAD()
- Common Table Expressions (CTEs)
- Correlated Subqueries
- Derived Tables

### 📌 Phase 5: Business Analysis
Answered 10 business questions to generate meaningful insights and recommendations for business decision-making.






---

# 📁 Project Structure

```text
Google_Play_Store_SQL_Project
│
├── README.md
├── sql
│   ├── 01_data_profiling.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_exploratory_data_analysis.sql
│   ├── 04_advanced_sql.sql
│   └── 05_business_analysis.sql
│
├── DATA
├── PYTHON
├── screenshots
└── LICENSE
```

---

# 🧠 SQL Skills Demonstrated

Throughout this project, I applied a wide range of SQL concepts, including:

### 📌 Basic SQL
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- LIMIT

### 📌 Aggregate Functions
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

### 📌 Data Cleaning
- CASE Statements
- String Functions
- Date Conversion
- Data Type Transformation

### 📌 Advanced SQL
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- NTILE()
- FIRST_VALUE()
- LAST_VALUE()
- LAG()
- LEAD()
- Common Table Expressions (CTEs)
- Correlated Subqueries
- Derived Tables

### 📌 Business Analysis
- KPI Analysis
- Category Performance
- Pricing Analysis
- User Rating Analysis
- Market Opportunity Analysis
- Business Recommendations




---

# 📊 Business Questions Answered

This project answers real-world business questions using SQL to support data-driven decision-making.

| No. | Business Question |
|----:|-------------------|
| 1 | Which app categories have the highest average ratings? |
| 2 | Which app categories have the highest total installs? |
| 3 | Do free apps receive better user ratings than paid apps? |
| 4 | Which app categories have the highest average app price? |
| 5 | Which app categories combine high ratings with high installs? |
| 6 | Which paid apps are priced above their category average? |
| 7 | Which app is the highest-rated in each category? |
| 8 | Which categories have the highest number of paid apps? |
| 9 | Which paid apps have the highest number of installs? |
| 10 | Which app categories provide the best business opportunities based on ratings, installs, and competition? |

---

# 📈 Key Business Insights

Some of the key findings from this analysis include:

- High user ratings do not always indicate high market adoption.
- Paid applications achieved slightly higher average ratings than free applications.
- Some categories demonstrate strong business potential by combining high ratings, strong installs, and relatively low competition.
- Premium pricing strategies are more common in specific categories where users perceive greater value.
- Successful applications balance app quality, pricing strategy, and user satisfaction.

---




---

# 📸 Project Screenshots

Below are screenshots demonstrating different stages of the project.

### 🔍 Data Profiling

Verified the dataset contains **10,841 rows** and **13 columns** before analysis.

> *(<img width="1536" height="1024" alt="01_data_profiling png" src="https://github.com/user-attachments/assets/d710791e-9b73-46ca-a958-a09c707e7e58" />
)*

### Data Cleaning

Prepared the dataset by removing duplicates, handling missing values, and correcting data types.

> *(<img width="1536" height="1024" alt="02_data_cleaning png" src="https://github.com/user-attachments/assets/fd85a754-26af-4b6a-931e-32e5d584a11b" />

)*

### Exploratory Data Analysis (EDA)

Analyzed app categories, ratings, installs, and pricing patterns.

> *(<img width="771" height="1024" alt="03_E_D_A png" src="https://github.com/user-attachments/assets/60fe0120-ce18-447b-b01a-e046ef32a149" />
)*

### Advanced SQL

Implemented Window Functions, CTEs, ranking functions, and analytical SQL techniques.

> *(<img width="755" height="1024" alt="04_avance_png" src="https://github.com/user-attachments/assets/0a7c6eda-5015-4ecf-b6a1-e7541afcc98c" />
)*

### Business Analysis & Insights

Generated business recommendations by identifying market opportunities and high-performing app categories.

> *(<img width="1536" height="1024" alt="05_data_analysis_insights png" src="https://github.com/user-attachments/assets/2606cae0-0679-46bc-8edf-086e01708f1a" />
)*

---

# 🚀 Future Improvements

Some enhancements that can be added in future versions of this project:

- Build an interactive Power BI dashboard.
- Create visualizations using Python (Matplotlib/Plotly).
- Perform sentiment analysis on user reviews.
- Develop predictive models for app ratings and installs.
- Automate the data cleaning process using Python.
- Expand the analysis with additional Google Play Store datasets.

---

# 👨‍💻 About the Author

**Mohammed Basith**

I'm a BBA graduate with a strong interest in **Data Analytics** and **SAP FICO (S/4HANA)**. I enjoy solving business problems using data and continuously improving my analytical and technical skills through hands-on projects.

### Connect with Me

- **GitHub:** *(https://github.com/basith-datasci/google-play-store-sql-project/tree/main)*
- **LinkedIn:** *(linkedin.com/in/mohammedbasith)*

---

# ⭐ If you found this project helpful

If you found this project interesting, consider giving it a ⭐ on GitHub.

Thank you for visiting my project!


### 📈 Dashboard

Visual summary of the key insights derived from the analysis.

![Dashboard](screenshots/dashboard.png)
