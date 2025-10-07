-- Practice Problem 1:
SELECT ID,
    skill_count,
    skills
FROM (
        SELECT skills_job_dim.skill_id AS ID,
            COUNT(skills_job_dim.skill_id) AS skill_count,
            skills_dim.skills AS skills
        FROM skills_job_dim
            LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        GROUP BY skills_job_dim.skill_id,
            skills_dim.skills
    )
ORDER BY skill_count DESC
LIMIT 5;
-- Practice Problem 2:
SELECT ID,
    company_name,
    CASE
        WHEN job_posting_count < 10 THEN 'Small'
        WHEN job_posting_count BETWEEN 10 AND 50 THEN 'Medium'
        WHEN job_posting_count > 50 THEN 'Large'
    END AS company_size,
    job_posting_count
FROM (
        SELECT job_postings_fact.company_id AS ID,
            COUNT(job_postings_fact.company_id) AS job_posting_count,
            name AS company_name
        FROM job_postings_fact
            LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
        GROUP BY job_postings_fact.company_id,
            company_name
    );
-- PRACTICE PROBLEM 7:
WITH remote_job_skills AS (
    SELECT COUNT(*) AS number_of_jobs,
        skill_id,
        job_title_short
    FROM skills_job_dim
        INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE job_work_from_home = TRUE
        AND job_title_short = 'Data Analyst'
    GROUP BY skill_id,
        job_title_short
)
SELECT skills_dim.skill_id,
    skills_dim.skills AS skills_name,
    remote_job_skills.job_title_short,
    number_of_jobs
FROM remote_job_skills
    LEFT JOIN skills_dim ON remote_job_skills.skill_id = skills_dim.skill_id
GROUP BY skills_name,
    skills_dim.skill_id,
    number_of_jobs,
    remote_job_skills.job_title_short
ORDER BY number_of_jobs DESC
LIMIT 5;