select death.location, death.new_cases, death.total_cases, sum(death.new_cases)
over (partition by death.location
	order by death.location) as test_cases
from coviddeaths as death;

select * from coviddeaths;

select max(total_cases), location 
from coviddeaths
where location is not null 
group by location;



select death.continent, death.location, death.recorded_date, death.population, vacc.new_vaccinations , sum(vacc.new_vaccinations)
over (partition by death.location 
	order by death.location, death.recorded_date) as vaccinated
from covidDeaths as death
JOIN covidvaccinations as vacc
ON death.location = vacc.location and death.recorded_date = vacc.recorded_date
where death.continent is not null  and vacc.location = 'China'
order by 2,3;

select location, population from coviddeaths
where continent is not null
group by location
order by population;