--------------------------------------------------------------------------------------------------------------------------------------------
-- median
SELECT Defending
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Defending) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM male_players
    where Position in ('CB', 'LB', 'RB') )a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);
	-- defending=64
SELECT Crossing
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Crossing) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM male_players
    where Position in ('LWB', 'RWB') )a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);

SELECT Defending
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY Defending) AS rk, 
           COUNT(*) OVER () AS cnt
    FROM male_players
    where Position in ('LWB', 'RWB') )a
WHERE rk IN ((cnt + 1) / 2, (cnt + 2) / 2);
	-- defending for wingbacks=59
--------------------------------------------------------------------------------------------------------------------------------------------

SELECT *,
    ROUND(
         (passing / max_passing)  * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_passing,
           
           (SELECT MAX(positioning) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_aggression,
           (SELECT MAX(Strength) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Heading,
           (SELECT MAX(Def) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Def,
           (SELECT MAX(Standing) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Long_shot
    FROM male_players
    WHERE position IN ('CB', 'LB', 'RB') 
) AS subquery
where defending >= 64
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
           
           (SELECT MAX(positioning) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_aggression,
           (SELECT MAX(Strength) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Heading,
           (SELECT MAX(Def) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Def,
           (SELECT MAX(Standing) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Long_shot
    FROM male_players
    WHERE position IN ('CB', 'LB', 'RB') 
) AS subquery
where defending >= 64 and age<25 
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
           
           (SELECT MAX(positioning) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_aggression,
           (SELECT MAX(Strength) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Heading,
           (SELECT MAX(Def) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Def,
           (SELECT MAX(Standing) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Long_shot
    FROM male_players
    WHERE position IN ('CB', 'LB', 'RB') 
) AS subquery
where  defending >= 64 and age<25 and Nation=Club_Country
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
           
           (SELECT MAX(positioning) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_aggression,
           (SELECT MAX(Strength) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Heading,
           (SELECT MAX(Def) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Def,
           (SELECT MAX(Standing) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM male_players WHERE position IN ('CB', 'LB', 'RB')) AS max_Long_shot
    FROM male_players
    WHERE position IN ('CB', 'LB', 'RB') 
) AS subquery
where  defending >= 64 and age<25 and Club_country not in ('Italy','England','Spain','Germany')
ORDER BY impact desc;

-- budget defenders/young

Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from male_players
where  defending >= 64 and position IN ('CB', 'LB', 'RB')  
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;

Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from male_players
where  defending >= 64  and position IN ('CB', 'LB', 'RB')  and Nation=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;

Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from male_players
where  defending >= 64 and position IN ('CB', 'LB', 'RB')  and Nation!=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;

--------------------------------------------------------------------------------------------------------------------------------------------
-- wingbacks 
SELECT *,
    ROUND(
         (passing / max_passing) * (crossing / max_crossing) * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_passing,
           (SELECT MAX(crossing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_crossing,
           (SELECT MAX(positioning) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_aggression,
           (SELECT MAX(Strength) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Heading,
           (SELECT MAX(Def) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Def,
           (SELECT MAX(Standing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Long_shot
    FROM male_players
    WHERE position IN ('LWB', 'RWB') 
) AS subquery
where crossing >= 62 and defending>=59
ORDER BY impact DESC;

	-- wingback/overall best
SELECT *,
    ROUND(
         (passing / max_passing) * (crossing / max_crossing) * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_passing,
           (SELECT MAX(crossing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_crossing,
           (SELECT MAX(positioning) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_aggression,
           (SELECT MAX(Strength) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Heading,
           (SELECT MAX(Def) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Def,
           (SELECT MAX(Standing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Long_shot
    FROM male_players
    WHERE position IN ('LWB', 'RWB') 
) AS subquery
where crossing >= 62 and defending>=64 and Club_country not in ('Italy','England','Spain','Germany')
ORDER BY impact DESC;
	-- budget players/overall
    
SELECT *,
    ROUND(
         (passing / max_passing) * (crossing / max_crossing) * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_passing,
           (SELECT MAX(crossing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_crossing,
           (SELECT MAX(positioning) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_aggression,
           (SELECT MAX(Strength) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Heading,
           (SELECT MAX(Def) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Def,
           (SELECT MAX(Standing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Long_shot
    FROM male_players
    WHERE position IN ('LWB', 'RWB')  
) AS subquery
where crossing >= 62 and defending>=59 and age<25
ORDER BY Nation ,impact DESC;
	-- young/overall
    
SELECT *,
    ROUND(
         (passing / max_passing) * (crossing / max_crossing) * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_passing,
           (SELECT MAX(crossing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_crossing,
           (SELECT MAX(positioning) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_aggression,
           (SELECT MAX(Strength) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Heading,
           (SELECT MAX(Def) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Def,
           (SELECT MAX(Standing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Long_shot
    FROM male_players
    WHERE position IN ('LWB', 'RWB') 
) AS subquery
where crossing >= 62 and defending>=59 and age<25 and Nation=Club_Country
ORDER BY impact DESC;


SELECT *,
    ROUND(
         (passing / max_passing) * (crossing / max_crossing) * (positioning / max_positioning) * (acceleration / max_acceleration) * 
        (interceptions / max_interceptions) * (aggression / max_aggression) * (Strength / max_Strength) * (Stamina / max_Stamina) * (Jumping / max_Jumping) * 
        (Heading / max_Heading) * (Def / max_Def) * (Standing / max_Standing) * (Sliding / max_Sliding) * (Long_shot / max_Long_shot) * 1.00, 2
    )*100  AS impact
FROM (
    SELECT *,
           (SELECT MAX(passing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_passing,
           (SELECT MAX(crossing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_crossing,
           (SELECT MAX(positioning) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_positioning,
           (SELECT MAX(acceleration) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_acceleration,
           (SELECT MAX(interceptions) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_interceptions,
           (SELECT MAX(aggression) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_aggression,
           (SELECT MAX(Strength) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Strength,
           (SELECT MAX(Stamina) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Stamina,
           (SELECT MAX(Jumping) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Jumping,
           (SELECT MAX(Heading) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Heading,
           (SELECT MAX(Def) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Def,
           (SELECT MAX(Standing) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Standing,
           (SELECT MAX(Sliding) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Sliding,
           (SELECT MAX(Long_shot) FROM male_players WHERE position IN ('LWB', 'RWB')) AS max_Long_shot
    FROM male_players
    WHERE position IN ('LWB', 'RWB') 
) AS subquery
where crossing >= 62 and defending >=59 and age<25 and Club_country not in ('Italy','England','Spain','Germany')
ORDER BY Nation ,impact DESC;
	-- wingback/ young /budget
    
    
Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from male_players
where  crossing >= 62 and defending >=59 and position IN ('LWB', 'RWB') 
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;

Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from male_players
where crossing >= 62 and defending >=59 and position IN ('LWB', 'RWB')   and Nation=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;

Select Nation, Count(Name) as Total
from  (Select distinct Nation from male_players)b left join (Select Nation,Name
from male_players
where crossing >= 62 and defending >=59 and position IN ('LWB', 'RWB')   and Nation!=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;



