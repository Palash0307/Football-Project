--------------------------------------------------------------------------------------------------------------------------------------------
-- median
SELECT Defending
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Defending) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM female_players
    where Position in ('CB', 'LB', 'RB') )a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);
	-- defending=74
SELECT Crossing
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Crossing) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM female_players
    where Position in ('LWB', 'RWB') )a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);

-- crossing wingbacks=72

SELECT Defending
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Defending) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM female_players
    where Position in ('LWB', 'RWB') )a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);
	-- defending for wingbacks=73
--------------------------------------------------------------------------------------------------------------------------------------------
Select * from female_players where Position in ('LWB', 'RWB');
-- only 6 players play as a wingbacks

SELECT *,
    ROUND(
         (passing / max_passing)  * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_passing,
           
           (SELECT MAX(positioning) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_aggression,
           (SELECT MAX(Strength) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Heading,
           (SELECT MAX(Def) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Def,
           (SELECT MAX(Standing) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Long_shot
    FROM female_players
    WHERE position IN ('CB', 'LB', 'RB') 
) AS subquery
where defending >= 74
ORDER BY impact desc;


-- defender ranking/overall

SELECT *,
    ROUND(
         (passing / max_passing)  * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_passing,
           
           (SELECT MAX(positioning) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_aggression,
           (SELECT MAX(Strength) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Heading,
           (SELECT MAX(Def) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Def,
           (SELECT MAX(Standing) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Long_shot
    FROM female_players
    WHERE position IN ('CB', 'LB', 'RB') 
) AS subquery
where defending >= 74 and age<25
ORDER BY impact desc;

 -- defender ranking/young
 



SELECT *,
    ROUND(
         (passing / max_passing)  * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_passing,
           
           (SELECT MAX(positioning) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_aggression,
           (SELECT MAX(Strength) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Heading,
           (SELECT MAX(Def) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Def,
           (SELECT MAX(Standing) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Long_shot
    FROM female_players
    WHERE position IN ('CB', 'LB', 'RB') 
) AS subquery
where defending >= 74 and age<25 and nation=club_country
ORDER BY impact desc;

SELECT *,
    ROUND(
         (passing / max_passing)  * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_passing,
           
           (SELECT MAX(positioning) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_aggression,
           (SELECT MAX(Strength) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Heading,
           (SELECT MAX(Def) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Def,
           (SELECT MAX(Standing) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM female_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Long_shot
    FROM female_players
    WHERE position IN ('CB', 'LB', 'RB') 
) AS subquery
where defending >= 74 and age<25 and Club_country not in ('Italy','England','Spain','Germany')
ORDER BY impact desc;
-- budget defenders/young

Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from female_players
where crossing >= 74  and position IN ('CB', 'LB', 'RB') 
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;

Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from female_players
where crossing >= 74  and position IN ('CB', 'LB', 'RB') and Nation=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;

Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from female_players
where crossing >= 74  and position IN ('CB', 'LB', 'RB') and Nation!=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;
--------------------------------------------------------------------------------------------------------------------------------------------
-- wingbacks 

Select * from female_players where position IN ('LWB', 'RWB') ;
-- wing backs are very less

SELECT *,
    ROUND(
         (passing / max_passing) * (crossing / max_crossing) * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_passing,
           (SELECT MAX(crossing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_crossing,
           (SELECT MAX(positioning) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_aggression,
           (SELECT MAX(Strength) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Heading,
           (SELECT MAX(Def) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Def,
           (SELECT MAX(Standing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Long_shot
    FROM female_players
    WHERE position IN ('LWB', 'RWB') 
) AS subquery
where crossing >= 70 and defending>=72
ORDER BY impact DESC;
-- only 2 wingbacks of higher quality
	-- wingback/overall best
SELECT *,
    ROUND(
         (passing / max_passing) * (crossing / max_crossing) * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_passing,
           (SELECT MAX(crossing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_crossing,
           (SELECT MAX(positioning) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_aggression,
           (SELECT MAX(Strength) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Heading,
           (SELECT MAX(Def) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Def,
           (SELECT MAX(Standing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Long_shot
    FROM female_players
    WHERE position IN ('LWB', 'RWB') 
) AS subquery
where crossing >= 70 and defending>=72 and Club_country not in ('Italy','England','Spain','Germany')
ORDER BY impact DESC;
	-- no good defender from outside top 4 football producing countries
    -- More attackers 

	-- budget players/overall
    
SELECT *,
    ROUND(
         (passing / max_passing) * (crossing / max_crossing) * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_passing,
           (SELECT MAX(crossing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_crossing,
           (SELECT MAX(positioning) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_aggression,
           (SELECT MAX(Strength) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Heading,
           (SELECT MAX(Def) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Def,
           (SELECT MAX(Standing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Long_shot
    FROM female_players
    WHERE position IN ('LWB', 'RWB') 
) AS subquery
where crossing >= 70 and defending>=72 and age<25
ORDER BY impact DESC;
	-- young/overall
    -- defender quality is 
    
SELECT *,
    ROUND(
         (passing / max_passing) * (crossing / max_crossing) * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_passing,
           (SELECT MAX(crossing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_crossing,
           (SELECT MAX(positioning) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_aggression,
           (SELECT MAX(Strength) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Heading,
           (SELECT MAX(Def) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Def,
           (SELECT MAX(Standing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Long_shot
    FROM female_players
    WHERE position IN ('LWB', 'RWB') 
) AS subquery
where crossing >= 70 and defending>=72 and age<25 and Nation=Club_Country
ORDER BY impact DESC;
-- young/budget/

SELECT *,
    ROUND(
         (passing / max_passing) * (crossing / max_crossing) * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_passing,
           (SELECT MAX(crossing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_crossing,
           (SELECT MAX(positioning) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_aggression,
           (SELECT MAX(Strength) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Heading,
           (SELECT MAX(Def) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Def,
           (SELECT MAX(Standing) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM female_players WHERE position IN ('LWB', 'RWB')) AS max_Long_shot
    FROM female_players
    WHERE position IN ('LWB', 'RWB') 
) AS subquery
where crossing >= 70 and defending>=72 and  age<25 and Club_country not in ('Italy','England','Spain','Germany')
ORDER BY impact DESC;
	-- wingback/ young /bud
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from female_players
where crossing >= 70 and defending >=72 and position IN ('LWB', 'RWB')  
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;

Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from female_players
where crossing >= 70 and defending >=72 and position IN ('LWB', 'RWB')   and Nation=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;
    
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from female_players
where crossing >= 70 and defending >=72 and position IN ('LWB', 'RWB')   and Nation!=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;