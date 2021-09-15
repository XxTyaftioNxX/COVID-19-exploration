/*database we are using*/
use covidExploration;

/*turn strict mode off to accept empty string as input to decimal datatype*/
SET session sql_mode = "";

/*creating first table with similar column names to csv file*/
create table covidVaccinations(
	iso_code varchar(5),
    continent varchar(15),
    location varchar(40),
    recorded_date date,
    new_tests DECIMAL, 
    total_tests DECIMAL,
    total_tests_per_thousands DECIMAL,
    new_tests_per_thousands DECIMAL,
    new_tests_smoothed DECIMAL,
    new_tests_smoothed_per_thousand DECIMAL,
    positive_rate DECIMAL,
    tests_per_case DECIMAL,
    tests_units VARCHAR(25),
    total_vaccinations DECIMAL,
    people_vaccinated DECIMAL,
    people_fully_vaccinated DECIMAL,
    total_boosters DECIMAL,
	new_vaccinations DECIMAL,
    new_vaccinations_smoothedm DECIMAL,
    total_vaccinations_per_hundred DECIMAL,
    people_vaccinated_per_hundred DECIMAL,
    people_fully_vaccinated_per_hundred DECIMAL,
    total_boosters_per_hundred DECIMAL,
    new_vaccinations_smoothed_per_million DECIMAL,
    stringency_index DECIMAL,
    population_density DECIMAL,
    median_age DECIMAL,
    aged_65_older DECIMAL,
    aged_70_older DECIMAL,
    GDP_per_capita DECIMAL,
    extreme DECIMAL, 
    cardiovasc_death_rate DECIMAL, 
    diabetes_prevalance DECIMAL,
    female_smokers DECIMAL,
    male_smokers DECIMAL,
    handwashing_facilites DECIMAL,
    hospital_beds_per_thousand DECIMAL,
    life_expectancy DECIMAL,
    human_development_index DECIMAL,
    excess_mortality DECIMAL   
);

/*creating second table for second csv file similarly*/
create table covidDeaths(
	iso_code varchar(5),
    continent varchar(15),
    location varchar(40),
    recorded_date date,
    population DECIMAL, 
    total_cases DECIMAL,
    new_cases DECIMAL,
    new_cases_smoothed DECIMAL,
    total_deaths DECIMAL,
    new_deaths DECIMAL,
    new_deaths_smoothed DECIMAL,
    total_cases_per_million DECIMAL,
    new_cases_per_million DECIMAL,
    new_cases_smoothed_per_million DECIMAL,
	total_deaths_per_million DECIMAL,
    new_deaths_per_million DECIMAL,
    new_deaths_smoothed_per_million DECIMAL,
    reproduction_rate DECIMAL,
    icu_patients DECIMAL,
    icu_patients_per_million DECIMAL,
    hospital_patients DECIMAL,
    hospital_patients_per_million DECIMAL,
    weekly_icu_admissions DECIMAL,
    weekly_icu_admissions_per_million DECIMAL,
    weekly_hospital_admission DECIMAL,
    weekly_hospital_admissions_per_million DECIMAL
);

/* the file to import form must be located in the server*/
/*importing the CovidVaccinations csv file after arranging the date format*/

LOAD DATA INFILE 'COVID-19 exploration/CovidVaccinations.csv'
INTO TABLE covidExploration.covidVaccinations 
FIELDS TERMINATED BY ','
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'COVID-19 exploration/CovidDeaths.csv'
INTO TABLE covidExploration.covidDeaths 
FIELDS TERMINATED BY ','
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*checking if data is imported correctly or not*/
select * from covidexploration.covidvaccinations;
select * from covidexploration.coviddeaths;

select * from covidexploration.covidvaccinations
order by new_tests DESC;

