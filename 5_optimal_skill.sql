/*
Answer : what are the most optimal skills to learn (aka it's in high demand and high paying skills ) ?
- Identify the skills in high demand and associate with high average salary for data analyst roles
- Concentrate on jobs located in india with specific salaries 
- Why ? Target skills that offer job security (high demand) and financial benifits (high salaries),
    offering strategies insights for career development in data analysis
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills,
        count(skills_job_dim.job_id) as demand_count
    FROM 
        job_postings_fact
    JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg is not NULL AND
        job_country = 'India'
    GROUP BY 
        skills_dim.skill_id
), salary_per_skill as (
    SELECT 
        skills_dim.skill_id,
        skills,
        round(avg(salary_year_avg),2) as average_salary
    FROM 
        job_postings_fact
    JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg is not NULL and
        job_country = 'India'
    GROUP BY
        skills_dim.skill_id
)


SELECT 
    skills_demand.*,
    average_salary
FROM
    skills_demand
JOIN
    salary_per_skill on skills_demand.skill_id = salary_per_skill.skill_id
WHERE
    demand_count > 10
ORDER BY 
    average_salary DESC,
    demand_count DESC

