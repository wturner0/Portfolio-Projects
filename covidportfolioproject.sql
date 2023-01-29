SELECT *
FROM covidanalysis-376007.covidanalysis.coviddeaths
WHERE continent IS NOT NULL
ORDER BY 3,4;


--SELECT *
--FROM covidanalysis-376007.covidanalysis.covidvaccinations
--ORDER BY 3,4;

--Select data to be used

SELECT
  location,
  date,
  total_cases,
  new_cases,
  total_deaths,
  population
FROM covidanalysis-376007.covidanalysis.coviddeaths
WHERE continent IS NOT NULL
ORDER BY location, date;

-- Total Cases vs. Total Deaths
-- Likelihood of dying if you contract COVID in your country
SELECT 
  location,
  date,
  total_cases,
  total_deaths,
  ((total_deaths/total_cases)*100) AS covid_mortality_rate
FROM covidanalysis-376007.covidanalysis.coviddeaths
WHERE location LIKE '%States%' 
  AND
  continent IS NOT NULL
ORDER BY location, date;

-- Total Cases vs Population
-- Shows the percentage of a country's population that has contracted COVID
SELECT 
  location,
  date,
  population,
  total_cases,
  ((total_cases/population)*100) AS covid_infection_percentage
FROM covidanalysis-376007.covidanalysis.coviddeaths
WHERE location LIKE '%States%'
  AND
  continent IS NOT NULL
ORDER BY location, date DESC;

-- New Cases per Capita
SELECT
  location,
  date,
  population,
  new_cases,
  (new_cases/population) AS new_cases_per_capita
FROM covidanalysis-376007.covidanalysis.coviddeaths
WHERE continent IS NOT NULL
ORDER BY new_cases_per_capita DESC;

-- Looking at Countries with Highest Infection Rate
SELECT
  location,
  population,
  MAX(total_cases) AS highest_infection_count,
  MAX((total_cases/population)*100) AS percent_population_infected
FROM covidanalysis-376007.covidanalysis.coviddeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY percent_population_infected DESC;

-- Showing Countries with Highest Death Count Per Population
SELECT
  location,
  MAX(cast(total_deaths AS INT)) AS total_death_count
FROM covidanalysis-376007.covidanalysis.coviddeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY total_death_count DESC;

-- Breaking Total Deaths Down by Continent
SELECT
  location,
  MAX(cast(total_deaths AS INT)) AS total_death_count
FROM covidanalysis-376007.covidanalysis.coviddeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY total_death_count DESC;

-- Global Numbers
SELECT
  SUM(new_cases) AS total_cases,
  SUM(new_deaths) AS total_deaths,
  (SUM(new_deaths)/SUM(new_cases)*100) AS death_percentage
FROM covidanalysis-376007.covidanalysis.coviddeaths
WHERE continent IS NOT NULL
ORDER BY 1,2;

-- Looking at Total Population vs. Vaccination
SELECT
  dea.continent,
  dea.location,
  dea.date,
  dea.population,
  vac.new_vaccinations,
  SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated,
FROM covidanalysis-376007.covidanalysis.covidvaccinations vac
JOIN covidanalysis-376007.covidanalysis.coviddeaths dea
  ON vac.location = dea.location
  AND vac.date = dea.date
WHERE vac.continent IS NOT NULL
ORDER BY 1,2;

-- Temp Table
BEGIN
CREATE TEMP TABLE percentpopulationvaccinated
(
  continent string,
  location string,
  date datetime,
  population numeric,
  rolling_people_vaccinated numeric
);
INSERT INTO percentpopulationvaccinated
 SELECT
    dea.continent,
    dea.location,
    dea.date,
    dea.population,
    SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated,
  FROM covidanalysis-376007.covidanalysis.covidvaccinations vac
  JOIN covidanalysis-376007.covidanalysis.coviddeaths dea
    ON vac.location = dea.location
    AND vac.date = dea.date;
  --WHERE vac.continent IS NOT NULL
  END;

SELECT
  *,
  (rolling_people_vaccinated/population) * 100
FROM percentpopulationvaccinated;

-- Create View to store data for later visualizations
 CREATE VIEW covidanalysis.viewpopulationvaccinated AS
 SELECT
    dea.continent,
    dea.location,
    dea.date,
    dea.population,
    SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated,
  FROM covidanalysis-376007.covidanalysis.covidvaccinations vac
  JOIN covidanalysis-376007.covidanalysis.coviddeaths dea
    ON vac.location = dea.location
    AND vac.date = dea.date
WHERE vac.continent IS NOT NULL;

EXPORT DATA
  OPTIONS (
    uri = 'gs://bucket/folder/*.csv',
    format = 'CSV',
    overwrite = true,
    header = true,
    field_delimiter = ';')
AS (
  SELECT field1, field2
  FROM mydataset.table1
  ORDER BY field1
);