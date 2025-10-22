-- Data Analyst
SELECT skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS skills_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_country = 'Vietnam'
GROUP BY skills_dim.skill_id,
    skills_dim.skills
ORDER BY skills_count DESC
LIMIT 10;

-- Data Engineer
SELECT skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS skills_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Engineer'
    AND job_country = 'Vietnam'
GROUP BY skills_dim.skill_id,
    skills_dim.skills
ORDER BY skills_count DESC
LIMIT 10;

-- Data Scientist
SELECT skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS skills_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist'
    AND job_country = 'Vietnam'
GROUP BY skills_dim.skill_id,
    skills_dim.skills
ORDER BY skills_count DESC
LIMIT 10;
