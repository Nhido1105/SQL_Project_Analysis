-- Vietnam region
SELECT
    COUNT(job_id) AS vn_jobs,
    ROUND(AVG(salary_year_avg), 3) AS vn_avg_salary,
    CASE 
        WHEN job_location LIKE '%Ho Chi Minh%' THEN 'Ho Chi Minh'
        WHEN job_location LIKE '%Hanoi%' THEN 'Hanoi'
        WHEN job_location LIKE '%Da Nang%' THEN 'Da Nang'
        ELSE 'Other region'
    END AS region
FROM job_postings_fact
WHERE 
    job_country = 'Vietnam'
GROUP BY region
ORDER BY vn_jobs DESC


-- Top paying data and related jobs in Vietnam
SELECT 
    job_title,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::date,
    name AS company_name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    salary_year_avg IS NOT NULL
    AND job_country = 'Vietnam'
ORDER BY salary_year_avg DESC;