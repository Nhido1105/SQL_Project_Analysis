-- Case Expressions
SELECT COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN salary_year_avg < 60000 THEN 'Low'
        WHEN salary_year_avg > 100000 THEN 'High'
        ELSE 'Medium'
    END AS salary_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY salary_category
ORDER BY salary_category;
-- Subqueries
SELECT company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
        SELECT company_id
        FROM job_postings_fact
        WHERE job_no_degree_mention = TRUE
        ORDER BY company_id
    ) -- Common Table Expressions (CTEs)
    WITH company_job_counts AS (
        SELECT company_id,
            COUNT(*) AS total_counts
        FROM job_postings_fact
        GROUP BY company_id
    )
SELECT company_dim.name AS company_name,
    company_job_counts.total_counts AS total_jobs
FROM company_job_counts
    LEFT JOIN company_dim ON company_dim.company_id = company_job_counts.company_id
ORDER BY total_jobs DESC