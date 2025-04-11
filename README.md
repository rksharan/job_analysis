# Introduction
Dive into the data job market! Focusing on Data Analyst roles, this project explores top-paying jobs, In-Demand skills, and where high demand meets high-salary in data anlaystics.

# Background 
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

### The questions I wanted to answer through my SQL queries were: 

1. What are the top-paying data analyst jobs in india ?
2. what skills are required for this top-paying jobs ?
3. what skill are most in demand for data anaylsts ?
4. Which skills are associated with higher salaries ?
5. what are the most optimal skills to learn ?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- <b>SQL</b>: The backbone of my analysis, allowing me to query the database and unearth critical insights.

- <b>PostgreSQL</b>: The chosen database management system, ideal for handling the job posting data.

- <b>Visual Studio code</b>: My go-to for database management and executing SQL queries.

- <b>Git & GitHub</b>: Essential for version control and sharing my SQL scripts and Analysis, ensuring collabration and project tracking.

# The Analysis 
Each query for this project aimed at investigating specific aspects of the data analyst job market.

Here is how i approached the question: 

### 1. Top paying data analyst jobs in India
To identify the highest-paying roles, I filtered data analyst position by average yearly salary and location, focusing on India. This query highlights the high paying opportunities in the field. 

```sql
SELECT
    job_id,
    name as company_name,
    job_country,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date

FROM job_postings_fact
LEFT JOIN
    company_dim 
        on job_postings_fact.company_id = company_dim.company_id
where 
    job_title_short = 'Data Analyst' AND
    salary_year_avg is not NULL AND
    job_country = 'India'
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```

# What I Learned 
# Conclusion 
