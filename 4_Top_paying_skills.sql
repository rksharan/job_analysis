SELECT 
    skills,
    round(avg(salary_year_avg),2) as average_salary
FROM 
    job_postings_fact
JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg is not NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25

/*
Top Trends in High-Paying Skills
1. Big Data & Distributed Computing Pays Big
    - PySpark ($208K), Databricks ($142K), and Airflow ($126K) are leading the charge.
    - These tools are used in big data pipelines, distributed processing, and orchestration — showing a premium for scalable data engineering skills.

2. AI/ML-Focused Tools Are in Demand
    - DataRobot ($155K), Scikit-learn ($126K), Pandas ($152K), NumPy ($144K), and Jupyter ($153K) suggest that ML and data science-focused analysts are commanding higher salaries.
    - These tools are essential in model building, experimentation, and ML pipelines.

3. DevOps & Collaboration Tools Are Surprisingly Lucrative
    - Bitbucket ($189K), GitLab ($154K), Jenkins ($125K), Atlassian ($131K), and Notion ($125K) are unexpected entries.
    - Suggests that DataOps, collaboration, and CI/CD skills for ML or data workflows are being rewarded.

4. Cloud & Containerization Is a Must-Know
    - GCP ($123K), Kubernetes ($133K), and Linux ($137K) are valued.
    - Data analysts who can deploy, scale, or manage infrastructure are seen as higher-value contributors.


[
  {
    "skills": "pyspark",
    "average_salary": "208172.25"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189154.50"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515.00"
  },
  {
    "skills": "watson",
    "average_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "average_salary": "155485.50"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500.00"
  },
  {
    "skills": "swift",
    "average_salary": "153750.00"
  },
  {
    "skills": "jupyter",
    "average_salary": "152776.50"
  },
  {
    "skills": "pandas",
    "average_salary": "151821.33"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "145000.00"
  },
  {
    "skills": "golang",
    "average_salary": "145000.00"
  },
  {
    "skills": "numpy",
    "average_salary": "143512.50"
  },
  {
    "skills": "databricks",
    "average_salary": "141906.60"
  },
  {
    "skills": "linux",
    "average_salary": "136507.50"
  },
  {
    "skills": "kubernetes",
    "average_salary": "132500.00"
  },
  {
    "skills": "atlassian",
    "average_salary": "131161.80"
  },
  {
    "skills": "twilio",
    "average_salary": "127000.00"
  },
  {
    "skills": "airflow",
    "average_salary": "126103.00"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "125781.25"
  },
  {
    "skills": "jenkins",
    "average_salary": "125436.33"
  },
  {
    "skills": "notion",
    "average_salary": "125000.00"
  },
  {
    "skills": "scala",
    "average_salary": "124903.00"
  },
  {
    "skills": "postgresql",
    "average_salary": "123878.75"
  },
  {
    "skills": "gcp",
    "average_salary": "122500.00"
  },
  {
    "skills": "microstrategy",
    "average_salary": "121619.25"
  }
]
*/