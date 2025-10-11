# Data Analyst Market  
## Background and Description 
- **Objective:** This project was developed to understand more profoundly the data analyst market through the findings of top-paid and in-demand skills for these roles.
- **Main questions through these SQL queries:**

    1. What are the top-paying data analyst jobs?
    2. What skills are required for these jobs?
    3. What skills are most in demand for data analyst?
    4. Which skills are associated with higher salaries?
    5. What are the most optimal skills to learn? 

- **Data Description:**
    - The dataset was observed in 2023 with ... jobs across the world.
    - The data consists of 4 tables: company_dim, job_postings_fact, skills_dim, and skills_job_dim.
    - The insights are on job titles, locations, salaries, and important skills.

## Data Jobs Market Overview
### Countries with highest job postings
<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>job_country</th>
      <th>job_count</th>
      <th>avg_salary</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>United States</td>
      <td>206943</td>
      <td>126017.59</td>
    </tr>
    <tr>
      <th>1</th>
      <td>India</td>
      <td>51197</td>
      <td>113768.01</td>
    </tr>
    <tr>
      <th>2</th>
      <td>United Kingdom</td>
      <td>40439</td>
      <td>109843.68</td>
    </tr>
    <tr>
      <th>3</th>
      <td>France</td>
      <td>40028</td>
      <td>105211.15</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Germany</td>
      <td>27782</td>
      <td>115800.56</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Spain</td>
      <td>25123</td>
      <td>107299.06</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Singapore</td>
      <td>23702</td>
      <td>106535.45</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Sudan</td>
      <td>21519</td>
      <td>135037.56</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Netherlands</td>
      <td>20673</td>
      <td>115734.95</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Italy</td>
      <td>17073</td>
      <td>93196.32</td>
    </tr>
  </tbody>
</table>
</div>


- The USA remains the highest demand for data job postings with approximately 200,000 job postings.
- India and Europe shows a growing demand for these roles.
- The data job is concentrated in North America, along with significant opportunities in the Europe, and around Asia.


### Vietnam Data Market

| Job Title               | Job Count | Average Salary (USD) |
|-------------------------|-----------|----------------------|
| Data Engineer           | 768       | 98,508.19            |
| Data Scientist          | 378       | 89,066.67            |
| Data Analyst            | 338       | 90,842.45            |
| Software Engineer       | 280       | 50,733.33            |
| Senior Data Engineer    | 220       | 127,125.00           |
| Machine Learning Engineer| 114      | 71,381.25            |
| Senior Data Scientist   | 93        | 79,200.00            |
| Business Analyst        | 91        | 74,400.00            |
| Senior Data Analyst     | 71        | 100,512.50           |
| Cloud Engineer          | 70        | —                    |



## Insights Summary


### 1. Top-paying data analyst jobs



### 2. Skills Required




### 3. In-demand Skills




### 4. High Offered Salary Skills



### 5. Optimal Skills 


## Tools Used
- **SQL:** The main tool used for extracting, and ordering necessary data for further analysis.
- **PostgreSQL:** The database management system for handling this dataset.
- **Python:** Used for analyzing the extracted dataset, and visualizing charts.
- **Visual Studio Code:** Used for database management, the execution of SQL queries, and Python analysis.
- **Git & GitHub:** Essential for version control and sharing SQL and Python scripts along with the analysis, ensuring collaboration, and project tracking.

## Lesson learned