Select GK
from (Select *,row_number() over (order by GK desc) as rk, count(*) over () as cnt
from female_players where position='GK')a
where rk in ((cnt+1)/2,(cnt+2)/2);
	-- GK median=74


Select *,round((Passing/max_passing)*(positioning/ max_positioning)*(standing/max_standing)*(long_shot/max_long_shot)*(defending/max_defending)*
(physicality/max_physicality)*(reactions/max_reaction)*(composure/max_composure)*(jumping/max_jumping)*(shooting/max_shooting)
*(agility/max_agility)*1.00,2)*100 as impact
from (Select *,(Select max(passing) from female_players where position in ('GK')) as max_passing,
				(Select max(positioning) from female_players where position in ('GK')) as max_positioning,
				(Select max(standing) from female_players where position in ('GK')) as max_standing,
				(Select max(long_shot) from female_players where position in ('GK')) as max_long_shot,
                (Select max(defending) from female_players where position in ('GK')) as max_defending,
                (Select max(physicality) from female_players where position in ('GK')) as max_physicality,
                (Select max(reactions) from female_players where position in ('GK')) as max_reaction,
                (Select max(composure) from female_players where position in ('GK')) as max_composure,
                (Select max(jumping) from female_players where position in ('GK')) as max_jumping,
                (Select max(shooting) from female_players where position in ('GK')) as max_shooting,
                (Select max(agility) from female_players where position in ('GK')) as max_agility
	from female_players
    where position ='GK')subquery
where GK>=74
order by impact desc;



Select *,round((Passing/max_passing)*(positioning/ max_positioning)*(standing/max_standing)*(long_shot/max_long_shot)*(defending/max_defending)*
(physicality/max_physicality)*(reactions/max_reaction)*(composure/max_composure)*(jumping/max_jumping)*(shooting/max_shooting)
*(agility/max_agility)*1.00,2)*100 as impact
from (Select *,(Select max(passing) from female_players where position in ('GK')) as max_passing,
				(Select max(positioning) from female_players where position in ('GK')) as max_positioning,
				(Select max(standing) from female_players where position in ('GK')) as max_standing,
				(Select max(long_shot) from female_players where position in ('GK')) as max_long_shot,
                (Select max(defending) from female_players where position in ('GK')) as max_defending,
                (Select max(physicality) from female_players where position in ('GK')) as max_physicality,
                (Select max(reactions) from female_players where position in ('GK')) as max_reaction,
                (Select max(composure) from female_players where position in ('GK')) as max_composure,
                (Select max(jumping) from female_players where position in ('GK')) as max_jumping,
                (Select max(shooting) from female_players where position in ('GK')) as max_shooting,
                (Select max(agility) from female_players where position in ('GK')) as max_agility
	from female_players
    where position ='GK')subquery
where GK>=74 and age<25
order by impact desc;
	-- young gk

Select *,round((Passing/max_passing)*(positioning/ max_positioning)*(standing/max_standing)*(long_shot/max_long_shot)*(defending/max_defending)*
(physicality/max_physicality)*(reactions/max_reaction)*(composure/max_composure)*(jumping/max_jumping)*(shooting/max_shooting)
*(agility/max_agility)*1.00,2)*100 as impact
from (Select *,(Select max(passing) from female_players where position in ('GK')) as max_passing,
				(Select max(positioning) from female_players where position in ('GK')) as max_positioning,
				(Select max(standing) from female_players where position in ('GK')) as max_standing,
				(Select max(long_shot) from female_players where position in ('GK')) as max_long_shot,
                (Select max(defending) from female_players where position in ('GK')) as max_defending,
                (Select max(physicality) from female_players where position in ('GK')) as max_physicality,
                (Select max(reactions) from female_players where position in ('GK')) as max_reaction,
                (Select max(composure) from female_players where position in ('GK')) as max_composure,
                (Select max(jumping) from female_players where position in ('GK')) as max_jumping,
                (Select max(shooting) from female_players where position in ('GK')) as max_shooting,
                (Select max(agility) from female_players where position in ('GK')) as max_agility
	from female_players
    where position ='GK')subquery
where GK>=74 and age<25 and Club_country not in ('Italy','England','Spain','Germany')
order by impact desc;
	-- young gk/budget
    

Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from female_players
where  GK>=74
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;



Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from female_players
where  GK>=74  and Nation=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;


Select Nation, Count(Name) as Total
from  (Select distinct Nation from female_players)b left join (Select Nation,Name
from female_players
where  GK>=74  and Nation!=Club_country
order by Overall desc)a  using(Nation)
group by Nation
order by 2 desc;

