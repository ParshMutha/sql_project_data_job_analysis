/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/
with topdataanalyst as
(
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
LIMIT 10
)

SELECT topdataanalyst.*,
 s.skills
from topdataanalyst
INNER JOIN skills_job_dim as sj ON topdataanalyst.job_id = sj.job_id
 INNER JOIN skills_dim as s ON sj.skill_id = s.skill_id
order by salary_year_avg desc;

SELECT * from skills_dim