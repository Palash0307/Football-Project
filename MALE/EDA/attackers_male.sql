Select * from male_players;

Select distinct Position from male_players;

create or replace view attackers_male as
Select * 
from male_players
where Position in ('ST','CF','RW','LW');

Select * from attackers;

SELECT Composure
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Composure) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM male_players
    where Position in ('ST','CF','RW','LW'))a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);
	-- median composure=62



SELECT Finishing
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Finishing) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM male_players
    where Position in ('ST','CF','RW','LW')
) a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);
	-- finishing=67
    
    

SELECT Positioning
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Positioning) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM male_players
    where Position in ('ST','CF','RW','LW')
) a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);
	-- positioning=66
    
Select *
from attackers_male
where Composure>=62 and Finishing>=67 and Positioning>=66;

SELECT *,
    ROUND((pace / max_pace) * (shooting / max_shooting) * (dribbling / max_dribbling) *
          (defending / max_defending) * (acceleration / max_acceleration) * 
          (finishing / max_finishing) * (positioning / max_positioning) *
          (def / max_def) * (stamina / max_stamina) * (vision / max_vision) * 1.00, 2) * 100 AS impact
FROM (
    SELECT 
        (SELECT MAX(pace) FROM male_players) AS max_pace,
        (SELECT MAX(shooting) FROM male_players) AS max_shooting,
        (SELECT MAX(dribbling) FROM male_players) AS max_dribbling,
        (SELECT MAX(defending) FROM male_players) AS max_defending,
        (SELECT MAX(acceleration) FROM male_players) AS max_acceleration,
        (SELECT MAX(finishing) FROM male_players) AS max_finishing,
        (SELECT MAX(positioning) FROM male_players) AS max_positioning,
        (SELECT MAX(def) FROM male_players) AS max_def,
        (SELECT MAX(stamina) FROM male_players) AS max_stamina,
        (SELECT MAX(vision) FROM male_players) AS max_vision
) AS max_values,
male_players
WHERE Composure >= 62 AND Finishing >= 67 AND Positioning >= 66;



Select *
from attackers_male
where Composure>=62 and Finishing>=67 and Positioning>=66 and age<25;
	-- young/attacker
    
Select *
from attackers_male
where Composure>=80 and Finishing>=80 and Positioning>=80 and age<25;
	-- best players, in demand at young age

Select *
from attackers_male
where Composure>=80 and Finishing>=80 and Positioning>=80 and age>25;
	-- best players/at prime
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from attackers_male
where  Composure>=62 and Finishing>=67 and Positioning>=66 and Nation=Club_Country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;
	-- England and Italy produces good amount of attackers who plays at their respective domestic league
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from attackers_male
where  Composure>=62 and Finishing>=67 and Positioning>=66 
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;
	-- Argentina have higher demand around the world
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from attackers_male
where  Composure>=62 and Finishing>=67 and Positioning>=66 and Nation!=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;

-- Composure>=62 and Finishing>=67 and Positioning>=66
-- Argentina Produces highest number of attackers
-- Brazilian players are most in demand around the world

