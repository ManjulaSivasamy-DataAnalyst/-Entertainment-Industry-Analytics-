SELECT * FROM entertainment.enter;

-- 1. Top Performers by Career Earnings 
SELECT
  Entertainer,
  Total_Career_Earnings_Lakhs,
  Active_Years,
  Total_Shows,
  Total_Awards
FROM entertainment.enterntainment
ORDER BY Total_Career_Earnings_Lakhs DESC
LIMIT 10;

-- 2. Age vs Earnings Relationship 
SELECT 
  Age_Entertain,
  AVG(Total_Career_Earnings_Lakhs) AS Avg_Earnings
FROM entertainment.enterntainment
GROUP BY Age_EntertainTables
ORDER BY Age_Entertain;

-- 3. Gender-wise Career Analysis 
SELECT 
  Gender,
  COUNT(*) AS Total_Entertainers,
  AVG(Active_Years) AS Avg_Career_Length,
  AVG(Total_Career_Earnings_Lakhs) AS Avg_Earnings,
  SUM(Total_Awards) AS Total_Awards
FROM entertainment.enterntainment
GROUP BY Gender;

-- 4. Impact of Early Awards on Career 
-- here shows yes, no, true ,replace true to yes
UPDATE entertainment.enterntainment
SET Awarded_Early = 'Yes'
WHERE Awarded_Early = 'TRUE';
-- code Impact of Early Awards on Career
SELECT
  Awarded_Early,
  COUNT(*) AS Total_Entertainers,
  AVG(Active_Years) AS Avg_Career_Length,
  AVG(Total_Career_Earnings_Lakhs) AS Avg_Earnings
FROM entertainment.enterntainment
GROUP BY Awarded_Early;

-- 5. City-wise Talent Hub 
SELECT
  City,
  COUNT(*) AS Num_Entertainers,
  SUM(Total_Awards) AS Total_Awards,
  AVG(Total_Career_Earnings_Lakhs) AS Avg_Earnings
FROM entertainment.enterntainment
GROUP BY City
ORDER BY Num_Entertainers DESC;

-- 6. Award Winners vs Non-Winners 
-- here Received_award column has only true values ,
-- so i updated false value for who doesn't received awards
INSERT INTO entertainment.enterntainment (
  Entertainer, Gender, Birth_Year, Entertain_Year, Age_Entertain,
  Entertain_Name, First_Award_Year, Received_Award, Last_Work_Year,
  Active_Years, Is_Active, Career_End_Age, Career_Status, Awarded_Early,
  City, Total_Awards, Salary_Per_Show, Total_Shows, Total_Career_Earnings_Lakhs
)
VALUES (
  'Jordan', 'M', 1995, 2015, 20,
  'The Rise', NULL, FALSE, 2022,
  7, FALSE, 27, 'Retired', FALSE,
  'Delhi', 0, 3.5, 50, 175
);
INSERT INTO entertainment.enterntainment (
  Entertainer, Gender, Birth_Year, Entertain_Year, Age_Entertain,
  Entertain_Name, First_Award_Year, Received_Award, Last_Work_Year,
  Active_Years, Is_Active, Career_End_Age, Career_Status, Awarded_Early,
  City, Total_Awards, Salary_Per_Show, Total_Shows, Total_Career_Earnings_Lakhs
)
VALUES ('Priya Rao', 'F', 1992, 2012, 20,'Dream Debut', NULL, FALSE, 2020,  8, FALSE, 28, 'Retired', FALSE,  'Mumbai', 0, 2.8, 60, 168);


SELECT DISTINCT Received_Award FROM entertainment.enterntainment;

SELECT
  Received_Award,
  COUNT(*) AS Num_Entertainers,
  AVG(Active_Years) AS Avg_Years,
  AVG(Total_Career_Earnings_Lakhs) AS Avg_Earnings
FROM entertainment.enterntainment
GROUP BY Received_Award;


-- 7. Career End Age Trends 
SELECT
  Gender,
  AVG(Career_End_Age) AS Avg_Career_End_Age
FROM entertainment.enterntainment
GROUP BY Gender;

-- 8. Salary Efficiency 
SELECT
  Entertainer,
  Salary_Per_Show,
  Total_Shows,
  Total_Awards
FROM entertainment.enterntainment
ORDER BY Salary_Per_Show DESC
LIMIT 10;

-- 9. Career Longevity Leaders  
SELECT
  Entertainer,
  Active_Years,
  Total_Career_Earnings_Lakhs,
  Total_Shows
FROM entertainment.enterntainment
ORDER BY Active_Years DESC
LIMIT 10;

-- 10. Earnings by Era (Peak Industry Period) 
SELECT
  FLOOR(Entertain_Year  / 10) * 10 AS Decade,
  COUNT(*) AS Entertainers,
  AVG(Total_Career_Earnings_Lakhs) AS Avg_Earnings
FROM entertainment.enterntainment
GROUP BY Decade
ORDER BY Decade;
select Received_Award from entertainment.enterntainment
where Received_Award= 0;

drop table entertainment.enterntainment;


