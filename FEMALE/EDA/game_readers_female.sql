Use palash;
Show tables;
Select * from female_players;



SELECT 
    Nation,
    COUNT(Name) AS total_players_in_nation,
    SUM(COUNT(Name)) OVER (ORDER BY COUNT(Name) ASC) AS rolling_total_players
FROM 
    female_players
WHERE 
    Nation = Club_Country
GROUP BY 
    Nation
ORDER BY 
    total_players_in_nation ASC;



SELECT 
    Nation,
    COUNT(Name) AS player_count,
    a.sum_total
FROM 
    (
        SELECT 
            *,
            COUNT(*) OVER (ORDER BY COUNT(Name) ASC) AS sum_total
        FROM 
            female_players
        WHERE 
            Nation = Club_Country
    ) AS a
GROUP BY 
    Nation, 
    a.sum_total
ORDER BY 
    player_count ASC;


SELECT
    Nation,
    COUNT(Name) AS player_count,
    SUM(count(Name)) OVER (PARTITION BY Nation) AS sum_total,
FROM
    (
        SELECT
            *,
            SUM(COUNT(Name)) OVER (PARTITION BY Nation) AS sum_total
        FROM
            female_players
        WHERE
            Nation = Club_Country
    ) AS a
GROUP BY
    Nation
ORDER BY
    player_count ASC;


Alter table female_players
RENAME column `Long` to long_shot;

create or replace view game_readers_female as
Select *,(Finishing/Physicality) as fine_finisher,(Defending/Physicality) as fine_defender
from female_players
where (Finishing/Physicality)>1 and (Defending/Physicality)>1;

Select * from game_readers_female;

SELECT vision
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY vision) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM game_readers_female
) a
WHERE rk in ((cnt + 1) / 2,(cnt+2)/2);
	-- median vision of game readers=73
    
SELECT agility
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY agility) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM game_readers_female
) a
WHERE rk in ((cnt + 1) / 2,(cnt+2)/2);
	-- median agility=73
    
    
    
SELECT *,
    ROUND((pace / max_pace) * (shooting / max_shooting) * (dribbling / max_dribbling) *
          (defending / max_defending) * (acceleration / max_acceleration) * 
          (finishing / max_finishing) * (positioning / max_positioning) *
          (def / max_def) * (stamina / max_stamina) * (vision / max_vision) * 1.00, 2) * 100 AS impact
FROM (
    SELECT 
        (SELECT MAX(pace) FROM female_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_pace,
        (SELECT MAX(shooting) FROM female_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_shooting,
        (SELECT MAX(dribbling) FROM female_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_dribbling,
        (SELECT MAX(defending) FROM female_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_defending,
        (SELECT MAX(acceleration) FROM female_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_acceleration,
        (SELECT MAX(finishing) FROM female_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_finishing,
        (SELECT MAX(positioning) FROM female_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_positioning,
        (SELECT MAX(def) FROM female_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_def,
        (SELECT MAX(stamina) FROM female_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_stamina,
        (SELECT MAX(vision) FROM female_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_vision
) AS max_values,
female_players
WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1;



Select *
from game_readers_female
where Nation=Club_Country and Age<25
order by Nation;
	-- Gamereader/young/same country

Select *
from game_readers_female
where  Age<25
order by Nation;


Select *
from game_readers_female
where  Vision>=73 and agility>=73
order by Vision desc;
	-- game readers/vision/agility

Select *
from game_readers_female
where  Age<25 and Vision>=73 and agility>=73
order by Vision desc;
	-- young talent/vision/good finisher
    


Select Nation, Count(Name) as total_quality
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from game_readers_female
where  Age<25 and Vision>=73 and agility>=73
order by Vision desc)a  using(Nation)
group by Nation
order by 2 desc;
	-- France has high young quality players
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from game_readers_female
where   Vision>=73 and agility>=73
order by Vision desc)a  using(Nation)
group by Nation
order by 2 desc;
	-- France produces more players who have more control over the field

Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from game_readers_female
where   Vision>=73 and Nation=Club_Country and agility>=73
order by Vision desc)a  using(Nation)
group by Nation
order by 2 desc;
	-- maybe the reason behind their success in Europe Competitions, strong matches in domestic leagues
	-- top clubs come from these countries for European Competition
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from game_readers_female
where   Vision>=73 and Nation!=Club_Country and agility>=73
order by Vision desc)a  using(Nation)
group by Nation
order by 2 desc;
    
-- agility=73 vision=73