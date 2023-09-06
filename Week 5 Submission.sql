USE genzdataset;
SHOW Tables;

SELECT * FROM personalized_info;
SELECT * FROM manager_aspirations;
SELECT * FROM learning_aspirations;
SELECT DISTINCT(PreferredWorkSetup) FROM manager_aspirations;
SELECT COUNT(DISTINCT(PreferredWorkSetup)) FROM manager_aspirations;
SELECT * FROM mission_aspirations;

/*Query 1 */
SELECT 
    (COUNT(ResponseID) / (SELECT COUNT(*) FROM learning_Aspirations)) * 100 AS Percentage
FROM learning_Aspirations
WHERE PreferredWorkingEnvironment LIKE 'Every Day Office Environment%';

/*Query 2 */
SELECT (COUNT(ResponseID) / (SELECT COUNT(*) FROM learning_Aspirations)) * 100 AS Percentage
FROM learning_aspirations
WHERE ClosestAspirationalCareer LIKE 'Business Operations%' AND CareerInfluenceFactor LIKE 'My Parents%';

/*Query 3 */
SELECT 
     ROUND((COUNT(CASE WHEN p.gender like 'Male%' THEN 1 END) / COUNT(*)) * 100,2) AS Male_aspirants,
     ROUND((COUNT(CASE WHEN p.gender like 'Female%' THEN 1 END) / COUNT(*)) * 100,2) AS Female_aspirants
FROM personalized_info p
INNER JOIN learning_aspirations l
ON p.ResponseID = l.ResponseID
WHERE HigherEducationAbroad LIKE 'Yes%';

/*Query 4 */
SELECT
    COUNT(CASE WHEN Gender LIKE 'Male%' THEN 1 END) / (COUNT(*)) * 100  AS Male_GenZ,
    COUNT(CASE WHEN Gender LIKE 'Female%' THEN 1 END) / (COUNT(*)) * 100 AS Female_GenZ
FROM mission_aspirations
INNER JOIN personalized_info ON mission_aspirations.ResponseID = personalized_info.ResponseID 
WHERE MisalignedMissionLikelihood LIKE 'Will NOT%';

SELECT
    COUNT(CASE WHEN Gender LIKE 'Male%' THEN 1 END) / (COUNT(*)) * 100  AS Male_GenZ,
    COUNT(CASE WHEN Gender LIKE 'Female%' THEN 1 END) / (COUNT(*)) * 100 AS Female_GenZ
FROM mission_aspirations 
INNER JOIN personalized_info ON mission_aspirations.ResponseID = personalized_info.ResponseID 
WHERE MisalignedMissionLikelihood LIKE 'Will work%';

/* Query 5 */
SELECT DISTINCT(learning_aspirations.PreferredWorkingEnvironment)
FROM learning_aspirations
INNER JOIN personalized_info
ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE personalized_info.Gender LIKE 'Female%';

/* Query 6  */
SELECT (COUNT(m.ResponseID) / (SELECT COUNT(*) FROM personalized_info WHERE Gender LIKE 'Male%')) * 100 AS Percentage
FROM manager_aspirations m
INNER JOIN personalized_info p ON m.ResponseID = p.ResponseID
INNER JOIN mission_aspirations ma ON p.ResponseID = ma.ResponseID 
WHERE PreferredEmployer LIKE 'Employers who appreciates learning but%'; 


/* Query 7 (Find the corelation between gender and their preferred work setup) */
-- I have googles it as per the assignment and found that correlation is found between numerical
-- variables and not between categorical variables. It is suggesting chi-square test for categorical variables. 

/*Query 8 */
SELECT 
	 COUNT(CASE WHEN p.gender like 'Female%' THEN 1 END) AS Female_GenZ
FROM personalized_info p
INNER JOIN mission_aspirations m1 ON p.ResponseID=m1.ResponseID
INNER JOIN learning_aspirations l ON p.ResponseID=l.ResponseID
WHERE m1.NoSocialImpactLikelihood BETWEEN 1 AND 5;


/*Query 9 */
SELECT COUNT(personalized_info.ResponseID) AS Male_GenZ
FROM personalized_info
INNER JOIN learning_aspirations ON personalized_info.ResponseID = learning_aspirations.ResponseID
WHERE personalized_info.Gender LIKE 'Male%' AND learning_aspirations.CareerInfluenceFactor LIKE 'My Parents' 
AND learning_aspirations.HigherEducationAbroad LIKE 'Yes, I wil%';

/*Query 10 */
SELECT
    ROUND((COUNT(CASE WHEN p.Gender like 'Male%' THEN 1 END) / COUNT(*)) * 100, 2) AS Male_aspirants,
    ROUND((COUNT(CASE WHEN p.Gender like 'Female%' THEN 1 END) / COUNT(*)) * 100, 2) AS Female_aspirants
FROM Personalized_info p
INNER JOIN mission_aspirations m1 
ON p.ResponseID=m1.ResponseID
INNER JOIN learning_aspirations l 
ON p.ResponseID=l.ResponseID
WHERE m1.NoSocialImpactLikelihood BETWEEN 8 AND 10
AND l.HigherEducationAbroad like 'Yes%';

/* Query 11 */
SELECT p.Gender,ma.PreferredWorkSetup
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
GROUP BY p.Gender,ma.PreferredWorkSetup;

/* Query 12 (Detailed Breakdown of WorkLikelihood3Years) */
SELECT DISTINCT(WorkLikelihood3Years)
FROM manager_aspirations;

SELECT COUNT(ma.WorkLikelihood3Years) AS Female_will_work
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Female%' AND ma.WorkLikelihood3Years LIKE 'Will work%'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Female_will_be_hard
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Female%' AND ma.WorkLikelihood3Years LIKE 'This will%'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Female_No_way
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Female%' AND ma.WorkLikelihood3Years LIKE 'No way'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Female_No_way_crazy
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Female%' AND ma.WorkLikelihood3Years LIKE 'No way%'; 

/* Now for Male */
SELECT COUNT(ma.WorkLikelihood3Years) AS Male_will_work
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Male%' AND ma.WorkLikelihood3Years LIKE 'Will work%'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Male_will_be_hard
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Male%' AND ma.WorkLikelihood3Years LIKE 'This will%'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Male_No_way
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Male%' AND ma.WorkLikelihood3Years LIKE 'No way'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Male_No_way_crazy
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Male%' AND ma.WorkLikelihood3Years LIKE 'No way%'; 

/* Query 13 */
SELECT COUNT(ma.WorkLikelihood3Years) AS India_Will_work
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.CurrentCountry LIKE 'India%' AND ma.WorkLikelihood3Years LIKE 'Will work%'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS India_This_will
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.CurrentCountry LIKE 'India%' AND ma.WorkLikelihood3Years LIKE 'This will%'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS India_No_way
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.CurrentCountry LIKE 'India%' AND ma.WorkLikelihood3Years LIKE 'No way'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS India_No_waybut
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.CurrentCountry LIKE 'India%' AND ma.WorkLikelihood3Years LIKE 'No way%'; 

/* Query 14 */
SELECT p.Gender,
    AVG(CAST(SUBSTRING_INDEX(ExpectedSalary3Years, 'k', 1) AS SIGNED)) AS Avg_Starting_Salary
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
GROUP BY p.Gender;

/*Query 15 */
SELECT p.Gender,
    AVG(CAST(SUBSTRING_INDEX(ExpectedSalary5Years, 'k', 1) AS SIGNED)) AS Avg_Starting_Salary
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
GROUP BY p.Gender;

/* Query 16 */
SELECT p.Gender,
       AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ExpectedSalary3Years,'to',-1),'k',1) AS SIGNED)) AS Avg_Higherbar_Salary
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
GROUP BY p.Gender;

/* Query 17 */
SELECT p.Gender,
       AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ExpectedSalary5Years,'to',-1),'k',1) AS SIGNED)) AS Avg_Higherbar_Salary
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
GROUP BY p.Gender;


/* Query 18 */
SELECT p.Gender,
    AVG(CAST(SUBSTRING_INDEX(ExpectedSalary3Years, 'k', 1) AS SIGNED)) AS Avg_Starting_Salary
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
WHERE p.CurrentCountry LIKE 'India%'
GROUP BY p.Gender;

/* Query 19 */
SELECT p.Gender,
    AVG(CAST(SUBSTRING_INDEX(ExpectedSalary5Years, 'k', 1) AS SIGNED)) AS Avg_Starting_Salary
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
WHERE p.CurrentCountry LIKE 'India%'
GROUP BY p.Gender;


/* Query 20 */
SELECT p.Gender,
       AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ExpectedSalary3Years,'to',-1),'k',1) AS SIGNED)) AS Avg_Higherbar_Salary
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
WHERE p.CurrentCountry LIKE 'India%'
GROUP BY p.Gender;



/* Query 21 */
SELECT p.Gender,
       AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ExpectedSalary5Years,'to',-1),'k',1) AS SIGNED)) AS Avg_Higherbar_Salary
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
WHERE p.CurrentCountry LIKE 'India%'
GROUP BY p.Gender;



/* Query 22 */
-- these people will work for companies whose mission is misaligned
SELECT 
     COUNT(CASE WHEN p.Gender LIKE 'Male%' THEN 1 END) AS Male_GenZ,
     COUNT(CASE WHEN p.Gender LIKE 'Female%' THEN 1 END) AS Female_GenZ
FROM mission_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID 
WHERE p.CurrentCountry LIKE 'India%' AND ma.MisalignedMissionLikelihood LIKE 'Will work%';

-- these people will not work for comapnies whose mission is misaligned     
SELECT 
     COUNT(CASE WHEN p.Gender LIKE 'Male%' THEN 1 END) AS Male_GenZ,
     COUNT(CASE WHEN p.Gender LIKE 'Female%' THEN 1 END) AS Female_GenZ
FROM mission_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID 
WHERE p.CurrentCountry LIKE 'India%' AND ma.MisalignedMissionLikelihood LIKE 'Will NOT%';
