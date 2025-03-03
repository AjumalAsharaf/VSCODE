/*
    What are the top skills based on salary
    - Look at the average salary associated with each skill for Data Analyst Postions. 
    - Focous on roles with specified salaries, regardless of location.
    - Why? it reveals how different skills impact the salary level of Data Analyst and helps identify
      the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
     skills
ORDER BY
    average_salary DESC
LIMIT 25

/*
Top-Paying Data & Tech Skills – Key Trends
Big Data & AI Lead the Way – PySpark ($208K), DataRobot ($155K), Jupyter ($152K), Pandas ($151K), Scikit-Learn ($125K) highlight strong demand for AI, ML, and data engineering skills.

Cloud & DevOps Are Critical – Databricks ($141K), Kubernetes ($132K), GCP ($122K), Airflow ($126K), Jenkins ($125K) show the need for cloud, automation, and orchestration expertise.

Version Control & Programming Matter – Bitbucket ($189K), GitLab ($154K), Golang ($145K), Swift ($153K), Scala ($124K) reinforce the importance of efficient coding and collaboration tools.
*/