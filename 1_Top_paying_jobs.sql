/*
Question : 
 What are the top paying data anaylst jobs in india ?
 - it gives the optimal role and skills needed for good paying data analyst jobs
*/

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


