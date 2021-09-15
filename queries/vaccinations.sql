select death.continent, death.location, death.recorded_date, death.population, vacc.new_vaccinations , sum(vacc.new_vaccinations)
over (partition by death.location 
	order by death.location, death.recorded_date) as vaccinated
from covidDeaths as death
JOIN covidvaccinations as vacc
ON death.location = vacc.location and death.recorded_date = vacc.recorded_date
where death.continent is not null  and vacc.location = 'China'
order by 2,3;

/*total population and vaccinations using CTE*/
with popVvac (continent, location, recorded_date, population, new_vaccinations, vaccinated) 
AS (
	select death.continent, death.location, death.recorded_date, death.population, vacc.new_vaccinations , sum(vacc.new_vaccinations)
	over (partition by death.location 
		order by death.location, death.recorded_date) as vaccinated
	from covidDeaths as death
	JOIN covidvaccinations as vacc
	ON death.location = vacc.location and death.recorded_date = vacc.recorded_date
	where death.continent is not null
),
latest_entry as (
	select pv.*, ROW_NUMBER() 
    over (partition by location
		order by pv.vaccinated DESC) as rn
        from popVvac as pv 
)

select location, vaccinated, population  
from latest_entry 
where vaccinated > population
order by population desc;

-- how can population be less than vaccinated?
-- does the data has reduced the deaths in the population?

