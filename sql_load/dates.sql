-- Practice Problem 1:
-- Write a query to find the average salary both yearly (salary_year_avg) and hourly (salary_hour_avg)
-- For job postings that were posted after June 1, 2023
SELECT job_posted_date::DATE AS date_time,
    AVG(salary_year_avg) AS avg_salary_yearly,
    AVG(salary_hour_avg) AS avg_salary_hourly,
    job_schedule_type
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type,
    job_posted_date
ORDER BY job_posted_date ASC
    /*
     Practice Problem 2:
     Write a query to count the number of job postings for each month in 2023,
     adjusting the job_posted_date to be in America/New_York time zone before extracting the month.
     Assume the job_posted_date is stored in UTC. Group by and order by the month.
     */
SELECT COUNT(job_id) AS number_of_job_postings,
    EXTRACT(
        MONTH
        FROM (
                job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York'
            )
    ) AS month
FROM job_postings_fact
GROUP BY month
ORDER BY month;
/*
 Practice problem 3:
 Write a query to find companies (include company name) that have posted jobs offering health insurance,
 where these postings were made in the second quarter of 2023.
 use date extraction to filter by quarter.
 */
SELECT company_dim.name,
    EXTRACT(
        QUARTER
        FROM job_posted_date
    ) AS quarter,
    job_health_insurance
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_health_insurance = TRUE
    AND EXTRACT(
        QUARTER
        FROM job_posted_date
    ) = 2;