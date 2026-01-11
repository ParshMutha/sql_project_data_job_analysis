/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT jb.job_id,
jb.company_id,
jb.job_title_short,
jb.job_location,
jb.salary_year_avg,
jb.job_work_from_home,
c.name
 from job_postings_fact  as jb 
left JOIN company_dim as c
on jb.company_id = c.company_id
where job_title_short = 'Data Analyst'
AND job_work_from_home = TRUE
and salary_year_avg is not null
ORDER BY salary_year_avg DESC
LIMIT 10;