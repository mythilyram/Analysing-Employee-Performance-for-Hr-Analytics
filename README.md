# Employee Performance Analysis for HR Analytics

In this project, we conduct an extensive analysis of employee performance using both SQL and Python, providing valuable insights for HR analytics. 

The project encompasses preprocessing, cleaning, and data analysis to derive actionable HR information. 

This was a project done for HiCouncillor as a team of 4 members.

## Overview

Understanding employee performance is essential for HR teams to make informed decisions and develop effective strategies. This project combines SQL and Python for a comprehensive analysis. Here's what we've done:

[![Python Link](https://github.com/mythilyram/Analysing-Employee-Performance-for-Hr-Analytics/blob/main/Employee_Performance_for_Hr_Analytics.ipynb))

1. **Python Data Preprocessing**: Following the SQL analysis, we used Python for data preprocessing and cleaning:

   - Removed duplicates from the dataset.
   - Handled missing values in the 'previous_year_rating' column.
   - Ensured consistent data types in each column.
   - Removed leading and trailing whitespaces from string columns.

2. **Exporting the Cleaned Data**: We saved the cleaned dataset to a new CSV file, 'employees_cleaned.csv,' for further analysis.

## Data Cleaning Results

The data cleaning process helped us address inconsistencies and prepare the data for more in-depth HR analytics. The dataset is now ready for comprehensive analysis.

##
3. **SQL Data Analysis**: We performed data analysis using SQL, making the following key insights:

   [![SQL link](https://github.com/mythilyram/Analysing-Employee-Performance-for-Hr-Analytics/blob/main/Employee%20analysis%20HR%20HiC%20Proj.sql))

   - Calculated the average age of employees in each department and gender group.
   - Listed the top three departments with the highest average training scores.
   - Found the percentage of employees who have won awards in each region.
   - Showed the number of employees who have met more than 80% of KPIs for each recruitment channel and education level.
   - Calculated the average length of service for employees in each department, considering only employees with previous year ratings greater than or equal to 4.
   - Listed the top five regions with the highest average previous year ratings.
   - Showed the departments with more than 100 employees having a length of service greater than 5 years.
   - Displayed the average length of service for employees who have attended more than 3 trainings, grouped by department and gender.
   - Calculated the percentage of female employees who have won awards, per department.
   - Calculated the percentage of employees per department who have a length of service between 5 and 10 years.
   - Found the top three regions with the highest number of employees who have met more than 80% of their KPIs and received at least one award, grouped by department and region.
   - Calculated the average length of service for employees per education level and gender, considering only those employees who have completed more than 2 trainings and have an average training score greater than 75.
   - For each department and recruitment channel, found the total number of employees who have met more than 80% of their KPIs, have a previous_year_rating of 5, and have a length of service greater than 10 years.
   - Calculated the percentage of employees in each department who have received awards, have a previous_year_rating of 4 or 5, and an average training score above 70, grouped by department and gender.
   - Listed the top five recruitment channels with the highest average length of service for employees who have met more than 80% of their KPIs, have a previous_year_rating of 5, and an age between 25 and 45 years, grouped by department and recruitment channel.
  
4. ## Technologies Used

- Python-Pandas
- SQL (MySQL)
- Google Colab

## Repository Structure

- **[uncleaned_employees_final_dataset.csv](https://github.com/mythilyram/Analysing-Employee-Performance-for-Hr-Analytics/blob/main/Uncleaned_employees_final_dataset.csv)**: The original dataset used for both SQL and Python analysis.
- **[employees_cleaned.csv](https://github.com/mythilyram/Analysing-Employee-Performance-for-Hr-Analytics/blob/main/employees_cleaned.csv)**: The cleaned dataset.
- **[employee_performance_analysis_python](https://github.com/mythilyram/Analysing-Employee-Performance-for-Hr-Analytics/blob/main/Employee_Performance_for_Hr_Analytics.ipynb)**: The Python data cleaning and preprocessing notebook.
- **[employee_performance_analysis_sql](https://github.com/mythilyram/Analysing-Employee-Performance-for-Hr-Analytics/blob/main/Employee%20analysis%20HR%20HiC%20Proj.sql)**: The SQL analysis notebook.

## How to Use

1. Access the Python data cleaning and preprocessing code in the "[employee_performance_analysis_python](https://github.com/mythilyram/Analysing-Employee-Performance-for-Hr-Analytics/blob/main/Employee_Performance_for_Hr_Analytics.ipynb)" notebook.

2. Explore the SQL analysis code in the "[employee_performance_analysis_sql](https://github.com/mythilyram/Analysing-Employee-Performance-for-Hr-Analytics/blob/main/Employee%20analysis%20HR%20HiC%20Proj.sql)" notebook.

3. Use the cleaned dataset in the "[employees_cleaned.csv](https://github.com/mythilyram/Analysing-Employee-Performance-for-Hr-Analytics/blob/main/employees_cleaned.csv)" file for more advanced HR analytics.

- The original dataset provided the foundation for both SQL and Python analysis. It can be found in "[uncleaned_employees_final_dataset.csv](https://github.com/mythilyram/Analysing-Employee-Performance-for-Hr-Analytics/blob/main/Uncleaned_employees_final_dataset.csv)."

This project delivers a comprehensive HR analytics solution by combining Python for data preprocessing and SQL for analysis.

