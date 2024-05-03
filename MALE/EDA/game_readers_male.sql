show databases
use palash;
Select * from male_players;
--------------------------------------------------------------------------------------------------------------------------------------------
create or replace view game_readers_male as
Select *,(Finishing/Physicality) as fine_finisher,(Defending/Physicality) as fine_defender
from male_players
where (Finishing/Physicality)>1 and (Defending/Physicality)>1;

SELECT vision
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY vision) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM game_readers
) a
WHERE rk = (cnt + 1) / 2;
	-- median vision of game readers=67
    
SELECT agility
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY agility) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM game_readers
) a
WHERE rk = (cnt + 1) / 2;
	-- median agility=75
--------------------------------------------------------------------------------------------------------------------------------------------

Select * from game_readers;
	-- overall players
    
SELECT *,
    ROUND((pace / max_pace) * (shooting / max_shooting) * (dribbling / max_dribbling) *
          (defending / max_defending) * (acceleration / max_acceleration) * 
          (finishing / max_finishing) * (positioning / max_positioning) *
          (def / max_def) * (stamina / max_stamina) * (vision / max_vision) * 1.00, 2) * 100 AS impact
FROM (
    SELECT 
        (SELECT MAX(pace) FROM male_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_pace,
        (SELECT MAX(shooting) FROM male_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_shooting,
        (SELECT MAX(dribbling) FROM male_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_dribbling,
        (SELECT MAX(defending) FROM male_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_defending,
        (SELECT MAX(acceleration) FROM male_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_acceleration,
        (SELECT MAX(finishing) FROM male_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_finishing,
        (SELECT MAX(positioning) FROM male_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_positioning,
        (SELECT MAX(def) FROM male_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_def,
        (SELECT MAX(stamina) FROM male_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_stamina,
        (SELECT MAX(vision) FROM male_players WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1) AS max_vision
) AS max_values,
male_players
WHERE (Finishing / Physicality) > 1 AND (Defending / Physicality) > 1;




Select *
from game_readers_male
where Nation=Club_Country
order by Nation, age;
	-- players who play for the club of their nation
    -- spain and argentina

Select *
from game_readers_male
where Nation=Club_Country and Age<25
order by Nation;
	-- Gamereader/young/same country

Select *
from game_readers_male
where  Age<25
order by Nation;


Select *
from game_readers_male
where  Vision>=67 and agility>=75
order by Vision desc;
	-- game readers/vision/agility

Select *
from game_readers_male
where  Age<25 and Vision>=67 and agility>=75
order by Vision desc;
	-- young talent/vision/good finisher
    


Select Nation, Count(Name) as total_quality
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from game_readers_male
where  Age<25 and Vision>=67 and agility>=75
order by Vision desc)a  using(Nation)
group by Nation
order by 2 desc;
	-- spain has high young quality players
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from game_readers_male
where   Vision>=67 and agility>=75 
order by Vision desc)a  using(Nation)
group by Nation
order by 2 desc;
	-- spain produces more players who have more control over the field
	

Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from game_readers_male
where   Vision>=67 and Nation=Club_Country and agility>=75
order by Vision desc)a  using(Nation)
group by Nation
order by 2 desc;
	-- maybe the reason behind their success in Europe Competitions, strong matches in domestic leagues


Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from game_readers_male
where   Vision>=67 and Nation!=Club_Country and agility>=75
order by Vision desc)a  using(Nation)
group by Nation
order by 2 desc;
    
-- vision=67 agility=75 