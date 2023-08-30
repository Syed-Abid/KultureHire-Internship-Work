use genzdataset;

SHOW Tables;

SELECT * FROM learning_aspirations;

/*Query 1*/
SELECT COUNT(Gender) AS Male_Count 
FROM personalized_info
WHERE Gender LIKE 'Male%' AND CurrentCountry LIKE 'India%';

/*Query 2 */
SELECT COUNT(Gender) AS Female_Count
FROM personalized_info
WHERE Gender LIKE 'Female%' AND CurrentCountry LIKE 'India%';

/*Query 3 */
SELECT COUNT(learning_aspirations.ResponseID) AS GenZ_Affectedby_Parents
FROM learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID 
WHERE CareerInfluenceFactor LIKE 'My Parents%' AND CurrentCountry LIKE 'India%';

/*Query 4*/
SELECT COUNT(learning_aspirations.ResponseID) AS Female_GenZ_Affectedby_Parents
FROM learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID 
WHERE CareerInfluenceFactor LIKE 'My Parents%' AND CurrentCountry LIKE 'India%' AND Gender LIKE 'Female%';

/*Query 5*/
SELECT COUNT(learning_aspirations.ResponseID) AS Male_GenZ_Affectedby_Parents
FROM learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID 
WHERE CareerInfluenceFactor LIKE 'My Parents%' AND CurrentCountry LIKE 'India%' AND Gender LIKE 'Male%';

/*Query 6*/
SELECT
    SUM(CASE WHEN Gender LIKE 'Male%' THEN 1 ELSE 0 END) AS Male_GenZ_Affectedby_Parents,
    SUM(CASE WHEN Gender LIKE 'Female%' THEN 1 ELSE 0 END) AS Female_GenZ_Affectedby_Parents
FROM learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID 
WHERE CareerInfluenceFactor LIKE 'My Parents%' AND CurrentCountry LIKE 'India%';

/*Query 7 */
SELECT COUNT(learning_aspirations.ResponseID) AS Influence_by_media_influencer_both
FROM learning_aspirations
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor LIKE 'Influencers%'AND'Social Media%' AND CurrentCountry LIKE 'India%';

/* Query 8 */
SELECT
    SUM(CASE WHEN Gender LIKE 'Male%' THEN 1 ELSE 0 END) AS Male_GenZ_Affectedby_Parents,
    SUM(CASE WHEN Gender LIKE 'Female%' THEN 1 ELSE 0 END) AS Female_GenZ_Affectedby_Parents
FROM learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID 
WHERE CareerInfluenceFactor LIKE 'Influencers%' AND 'Social Media%' AND CurrentCountry LIKE 'India%';

/* Query 9 */
SELECT
    SUM(CASE WHEN CareerInfluenceFactor LIKE 'Social Media%' AND HigherEducationAbroad LIKE 'Yes%' THEN 1 ELSE 0 END) AS Genz_Going_Abroad
FROM learning_aspirations; 

/* Query 10 */
SELECT
    SUM(CASE WHEN CareerInfluenceFactor LIKE 'people in their circle%' AND HigherEducationAbroad LIKE 'Yes%' THEN 1 ELSE 0 END) AS Genz_Going_Abroad2
FROM learning_aspirations
