WITH tpj AS (
    SELECT job_id,
        job_title,
        job_country,
        salary_year_avg,
        job_posted_date::date,
        job_via,
        name AS company_name
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = 'TRUE'
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT tpj.*,
    skills_dim.skills AS skill_name
FROM tpj
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = tpj.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC;