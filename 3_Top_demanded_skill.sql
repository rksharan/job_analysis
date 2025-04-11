SELECT 
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM 
    job_postings_fact
JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country = 'India'
GROUP BY skills
ORDER BY
    demand_count DESC
LIMIT 5