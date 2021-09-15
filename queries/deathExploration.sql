use covidExploration;

select * from covidDeaths;

/*total population dead*/
select location, max(population) as population, max(total_deaths) as total_deaths, (max(total_deaths)/max(population))*100 as percent_dead
from covidDeaths
group by location
order by percent_dead desc;

/*total infected dead in Nepal*/
select location, max(total_cases) as total_cases, max(total_deaths) as total_deaths, (max(total_deaths)/max(total_cases))*100 as percent_dead
from covidDeaths
#group by location
where location = 'Nepal'
order by percent_dead desc;

#country with highest infection rate
select location, max(total_cases) as most_cases, max(population) as current_population, (max(total_cases)/max(population))*100 as infection_rate
from covidDeaths
where continent is not null
group by location
order by infection_rate desc;  

-- continent 
select continent, max(total_deaths) 
from covidDeaths
where continent is not null
group by continent
order by max(total_deaths) desc;
 
-- Gobal tally of deaths/day
select recorded_date, sum(new_cases), sum(new_deaths), (sum(new_deaths)/sum(new_cases))*100 as death_rate
from covidDeaths
group by recorded_date
order by recorded_date; 
