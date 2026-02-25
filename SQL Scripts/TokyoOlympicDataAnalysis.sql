Select * from gold_medals_by_country;

select * from gold_athlete_summary;

select * from gold_coach_summary;

select * from gold_gender_avg;


-- 1. Top Athletes by Gold Medals

SELECT TOP 10 PersonName, Country, Discipline, Gold_Total
FROM gold_athlete_summary
ORDER BY Gold_Total DESC;


-- 2. Total Medals by Country

SELECT TeamCountry, Total_Gold, Total_Silver, Total_Bronze, Total_Medals
FROM gold_medals_by_country
ORDER BY Total_Medals DESC;

-- 3. Average Golds by Gender in Each Discipline

SELECT Discipline, Average_Male, Average_Female
FROM gold_gender_avg
ORDER BY Discipline;


-- 4. Countries with Most Coaches per Discipline

SELECT top 10 Country, Discipline, Number_of_Coaches
FROM gold_coach_summary
ORDER BY Number_of_Coaches DESC;

-- 5. Top Countries by Gold Medals per Athlete

SELECT top 10 a.Country,
       SUM(a.Gold_Total) AS Athlete_Gold,
       m.Total_Gold AS Country_Gold,
       ROUND(m.Total_Gold / COUNT(a.PersonName), 2) AS Gold_Per_Athlete
FROM gold_athlete_summary a
JOIN gold_medals_by_country m
  ON a.Country = m.TeamCountry
GROUP BY a.Country, m.Total_Gold
ORDER BY Gold_Per_Athlete DESC;


-- 6. Compare Number of Coaches vs Golds

SELECT c.Country, c.Discipline, c.Number_of_Coaches, 
       SUM(a.Gold_Total) AS Total_Gold
FROM gold_coach_summary c
LEFT JOIN gold_athlete_summary a
  ON c.Country = a.Country AND c.Discipline = a.Discipline
GROUP BY c.Country, c.Discipline, c.Number_of_Coaches
ORDER BY Total_Gold DESC;

-- 7. Disciplines Where Women Outperform Men

SELECT Discipline
FROM gold_gender_avg
WHERE Average_Female > Average_Male;

-- 8. Top 5 Countries per Discipline by Golds

SELECT Country, Discipline, SUM(Gold_Total) AS Total_Gold
FROM gold_athlete_summary
GROUP BY Country, Discipline
QUALIFY ROW_NUMBER() OVER (PARTITION BY Discipline ORDER BY SUM(Gold_Total) DESC) <= 5;