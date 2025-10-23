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
ORDER BY salary_year_avg DESC
LIMIT 20;


-- Data jobs demand in Vietnam by region
SELECT
    CASE 
        WHEN job_title_short LIKE '%Data Engineer%' THEN 'Data Engineer'
        WHEN job_title_short LIKE '%Data Analyst%' THEN 'Data Analyst'
        WHEN job_title_short LIKE '%Data Scientist%' THEN 'Data Scientist'
        ELSE 'Other Data Related Jobs'
    END AS title,
    COUNT(job_id) AS job_count,
    CASE 
        WHEN job_location LIKE '%Ho Chi Minh%' THEN 'Ho Chi Minh'
        WHEN job_location LIKE '%Hanoi%' THEN 'Hanoi'
        WHEN job_location LIKE '%Da Nang%' THEN 'Da Nang'
        ELSE 'Other region'
    END AS region,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
WHERE job_country = 'Vietnam'
GROUP BY title, region
ORDER BY job_count DESC;


-- Top data jobs demand from leading companies in Vietnam
SELECT 
    name AS company_name,
    job_title_short,
    COUNT(job_id) AS job_count,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_country = 'Vietnam'
    AND salary_year_avg IS NOT NULL
GROUP BY name, job_title_short
ORDER BY job_count DESC;