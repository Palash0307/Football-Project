create or replace view attackers_female as
Select * 
from female_players
where Position in ('ST','CF','RW','LW');

Select * from attackers;

SELECT Composure
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Composure) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM female_players
    where Position in ('ST','CF','RW','LW'))a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);
	-- median composure=69



SELECT Finishing
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Finishing) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM female_players
    where Position in ('ST','CF','RW','LW')
) a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);
	-- finishing=75
    
    

SELECT Positioning
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Positioning) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM female_players
    where Position in ('ST','CF','RW','LW')
) a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);
	-- positioning=77
    
    

SELECT *,
    ROUND((pace / max_pace) * (shooting / max_shooting) * (dribbling / max_dribbling) *
          (defending / max_defending) * (acceleration / max_acceleration) * 
          (finishing / max_finishing) * (positioning / max_positioning) *
          (def / max_def) * (stamina / max_stamina) * (vision / max_vision) * 1.00, 2) * 100 AS impact
FROM (
    SELECT 
        (SELECT MAX(pace) FROM female_players) AS max_pace,
        (SELECT MAX(shooting) FROM female_players) AS max_shooting,
        (SELECT MAX(dribbling) FROM female_players) AS max_dribbling,
        (SELECT MAX(defending) FROM female_players) AS max_defending,
        (SELECT MAX(acceleration) FROM female_players) AS max_acceleration,
        (SELECT MAX(finishing) FROM female_players) AS max_finishing,
        (SELECT MAX(positioning) FROM female_players) AS max_positioning,
        (SELECT MAX(def) FROM female_players) AS max_def,
        (SELECT MAX(stamina) FROM female_players) AS max_stamina,
        (SELECT MAX(vision) FROM female_players) AS max_vision
) AS max_values,
female_players
WHERE Composure >= 67 AND Finishing >= 75 AND Positioning >= 77;


Select *
from attackers_female
where Composure>=67 and Finishing>=75 and Positioning>=77 and age<25;
-- young/attacker


Select *
from attackers_female
where Composure>=67 and Finishing>=75 and Positioning>=77 and age>25;
	-- best players/at prime
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from attackers_female
where  Composure>=67 and Finishing>=75 and Positioning>=77 and Nation=Club_Country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;
	-- Spain and Germany produces good amount of attackers who plays at their respective domestic league
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from attackers_female
where Composure>=67 and Finishing>=75 and Positioning>=77 
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from attackers_female
where Composure>=67 and Finishing>=75 and Positioning>=77 and Nation !=Club_Country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;
	-- US have higher demand around the world


-- attackers male have higher attributes than female
-- game readers in female have higher competition
-- US female attackers are more in Demand around the world
-- US female forwards are more in numbers
