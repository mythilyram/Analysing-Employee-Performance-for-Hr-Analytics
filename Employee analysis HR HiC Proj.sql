#HIcouncillor project May 8 2013 - Analysing Employee Performance for Hr Analytics Using Python and MySQL
/* CREATE TABLE */
CREATE TABLE IF NOT EXISTS employee(employee_id INT(11),
department VARCHAR(100),
region VARCHAR(100),
education VARCHAR(100),
gender VARCHAR(100),
recruitment_channel VARCHAR(100),
no_of_trainings DECIMAL(10,2),
age DECIMAL(10,2),
previous_year_rating VARCHAR(100),
length_of_service DECIMAL(10,2),
KPIs_met_more_than_80 DECIMAL(10,2),
awards_won DECIMAL(10,2),
avg_training_score DECIMAL(10,2));

/* INSERT QUERY SAMPLE- used data import to bulk import csv*/
-- INSERT INTO employee(employee_id,department,region,education,gender,recruitment_channel,no_of_trainings,age,previous_year_rating,length_of_service,KPIs_met_more_than_80,awards_won,avg_training_score) VALUES( 8724,'Technology','region_26','Bachelors','m','sourcing',1,24,'',1,1,0,77);

select count(*) from employee;

#1 Find the average age of employees in each department and gender group. ( Round average  age up to two decimal places if needed)
SELECT  
	department,
	gender,
    round(avg(age),2)
FROM employee
GROUP BY 1,2
ORDER BY department, gender; 

#2 List the top 3 departments with the highest average training scores. ( Round average scores up to two decimal places if needed)   
SELECT 
	department,
    round(avg(avg_training_score),2)
FROM employee
GROUP BY 1
ORDER BY 2 desc
LIMIT 3;    

#Find the percentage of employees who have won awards in each region. (Round percentages up to two decimal places if needed)
SELECT region,
SUM(awards_won), ROUND(COUNT(*) * 100/ (SELECT SUM(awards_won) FROM employee ),2) AS award_percentage
FROM employee
WHERE awards_won != 0 
GROUP BY region;
-- SELECT 
-- 	region,
--     sum(awards_won) as award_count,
--     count(*) as total_employees,
--     round((sum(awards_won)/COUNT(*)*100),2) as pct_awarded
-- FROM employee
-- GROUP BY 1   ;    

#4 Show the number of employees who have met more than 80% of KPIs for each recruitment channel and education level.
SELECT
	recruitment_channel,
    education,
	COUNT(KPIs_met_more_than_80)
FROM employee
WHERE KPIs_met_more_than_80
GROUP BY 1 ,2
ORDER BY 1,2;

# 5 Find the average length of service for employees in each department, considering only employees with previous year ratings greater than or equal to 4. ( Round average length up to two decimal places if needed)
SELECT  
	department,
    round(avg(length_of_service),2)
FROM employee
WHERE previous_year_rating >=4
GROUP BY 1
ORDER BY department; 

# 6 List the top 5 regions with the highest average previous year ratings. ( Round average ratings up to two decimal places if needed)
SELECT  
	region,
    round(avg(previous_year_rating),2)
FROM employee
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

# 7 List the departments with more than 100 employees having a length of service greater than 5 years.
SELECT 
	department,
    COUNT(employee_id)
FROM employee
WHERE length_of_service>5
GROUP BY department
HAVING COUNT(employee_id)>100     
ORDER BY 2 DESC;

# 8 Show the average length of service for employees who have attended more than 3 trainings, grouped by department and gender. ( Round average length up to two decimal places if needed)
 SELECT 
 	department,
     gender,
     round(avg(length_of_service),2) as period
     FROM employee
 WHERE no_of_trainings>3-- (SELECT employee_id,count(no_of_trainings) as training.count FROM employee GROUP BY employee_id)
  GROUP BY department,gender;
# 9 Find the percentage of female employees who have won awards, per department. Also show the number of female employees who won awards and total female employees. ( Round percentage up to two decimal places if needed)*/
SELECT 
	department, 
	COUNT(*) as Total_females ,
    sum(awards_won) as Females_won_award, 
    round((sum(awards_won)/COUNT(*)*100),2) as  female_award_winners_percentage
    FROM employee 
    WHERE gender = 'f' 
    GROUP BY department;    
-- SELECT department, count(*) as tot_female_emp FROM employee WHERE gender = 'f' AND awards_won =1 GROUP BY department;    
-- SELECT employee_id,count(no_of_trainings) as training FROM employee GROUP BY employee_id;
#  10. Calculate the percentage of employees per department who have a length of service between 5 and 10 years. ( Round percentage up to two decimal places if needed)
Select 
	department, 
    round(count(case when length_of_service between 5 and 10 then 1 else null end) *100/nullif(count(*),0),2) as percent
From employee
Group by department;

# 11. Find the top 3 regions with the highest number of employees who have met more than 80% of their KPIs and received at least one award, grouped by department and region.
SELECT
	department,
    region,
    COUNT(*)
FROM employee
WHERE KPIs_met_more_than_80 =1 AND awards_won >= 1
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 3;

# 12. Calculate the average length of service for employees per education level and gender, considering only those employees who have completed more than 2 trainings and have an average training score greater than 75 ( Round average length up to two decimal places if needed)
SELECT
	education,
    gender,
	round(avg(length_of_service),2) as avg_service
FROM employee
WHERE no_of_trainings > 2 AND avg_training_score > 75
GROUP BY education,gender;    
 
# 13.For each department and recruitment channel, find the total number of employees who have met more than 80% of their KPIs, have a previous_year_rating of 5, and have a length of service greater than 10 years.
SELECT
	department,
    recruitment_channel,
    count(*) as total_employees
FROM employee
WHERE KPIs_met_more_than_80 AND previous_year_rating =5 AND length_of_service >10
GROUP BY 1,2;    

# 14.Calculate the percentage of employees in each department who have received awards, have a previous_year_rating of 4 or 5, and an average training score above 70, grouped by department and gender ( Round percentage up to two decimal places if needed).
with cte1 as
(SELECT
	department,gender,
    COUNT(*) as c1
FROM employee  
WHERE awards_won  =1 AND previous_year_rating in(4,5) AND avg_training_score>70
GROUP BY department,gender),
cte2 as
(SELECT
	department,gender,
    COUNT(*) as c2
FROM employee  
#WHERE awards_won  =1 AND previous_year_rating in(4,5) AND avg_training_score>70
GROUP BY department,gender)
select department,gender ,COALESCE(ROUND((c1/c2*100),2),0) from cte1 left join cte2
USING(department,gender);

# 15. List the top 5 recruitment channels with the highest average length of service for employees who have met more than 80% of their KPIs, 
-- have a previous_year_rating of 5, and an age between 25 and 45 years, grouped by department and recruitment channel. 
-- ( Round average length up to two decimal places if needed).
select * from employee
limit 1;
SELECT 
	department,
	recruitment_channel,
    ROUND(avg(length_of_service),2) AS avg_len_of_service
FROM employee
WHERE KPIs_met_more_than_80=0 AND previous_year_rating = 5 AND age BETWEEN 25 AND 45
GROUP BY department,recruitment_channel    
ORDER BY avg_len_of_service desc
LIMIT 5;







-- SELECT employee_id,count(no_of_trainings) as training_count FROM employee GROUP BY employee_id ORDER BY training_count desc;
