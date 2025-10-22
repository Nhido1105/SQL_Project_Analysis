-- Countries with highest job postings
SELECT 
    job_country,
    COUNT(job_id) AS job_count,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
WHERE 
    job_country IS NOT NULL
GROUP BY job_country
ORDER BY job_count DESC 


-- Top paying data and related jobs
SELECT job_id,
    job_title,
    job_title_short,
    job_location,
    job_via,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::date,
    name AS company_name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;


-- Highest number of job postings
SELECT 
    job_country,
    job_title_short,
    COUNT(job_id) AS job_count,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
WHERE 
    job_country IS NOT NULL
GROUP BY job_country,
    job_title_short
ORDER BY job_count DESC 


-- Top data jobs by country
SELECT 
    job_country,
    job_title_short,
    job_count,
    avg_salary
FROM (
    SELECT 
        job_country,
        job_title_short,
        COUNT(job_id) AS job_count,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary,
        CASE
            WHEN COUNT(job_id) = MAX(COUNT(job_id)) OVER (PARTITION BY job_country) THEN 'Top Job'
            ELSE 'Other Jobs'
        END AS top_jobs
    FROM job_postings_fact
    WHERE 
        job_country IS NOT NULL
    GROUP BY job_country,
        job_title_short
    ORDER BY job_count DESC 
) 

WHERE 
    job_country IS NOT NULL
    AND top_jobs = 'Top Job'
GROUP BY job_country, job_title_short, job_count, avg_salary
ORDER BY job_count DESC 




-- Vietnam top data jobs
SELECT 
    job_title_short,
    COUNT(job_id) AS job_count,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
WHERE 
    job_country IS NOT NULL
    AND job_country = 'Vietnam'
GROUP BY job_country,
    job_title_short
ORDER BY job_count DESC 