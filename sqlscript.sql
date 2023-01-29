{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red39\green78\blue204;\red255\green255\blue254;\red0\green0\blue0;
\red42\green55\blue62;\red238\green57\blue24;\red204\green0\blue78;\red21\green129\blue62;\red107\green0\blue1;
}
{\*\expandedcolortbl;;\cssrgb\c20000\c40392\c83922;\cssrgb\c100000\c100000\c99608;\cssrgb\c0\c0\c0;
\cssrgb\c21569\c27843\c30980;\cssrgb\c95686\c31765\c11765;\cssrgb\c84706\c10588\c37647;\cssrgb\c5098\c56471\c30980;\cssrgb\c50196\c0\c0;
}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 SELECT\cf0 \strokec4  \cf5 \strokec5 *\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NOT\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  \cf6 \strokec6 3\cf0 \strokec4 ,\cf6 \strokec6 4\cf0 \strokec4 ;\cb1 \
\
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 --SELECT *\cf0 \cb1 \strokec4 \
\cf7 \cb3 \strokec7 --FROM covidanalysis-376007.covidanalysis.covidvaccinations\cf0 \cb1 \strokec4 \
\cf7 \cb3 \strokec7 --ORDER BY 3,4;\cf0 \cb1 \strokec4 \
\
\cf7 \cb3 \strokec7 --Select data to be used\cf0 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   location,\cb1 \
\cb3   \cf2 \strokec2 date\cf0 \strokec4 ,\cb1 \
\cb3   total_cases,\cb1 \
\cb3   new_cases,\cb1 \
\cb3   total_deaths,\cb1 \
\cb3   population\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NOT\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  location, \cf2 \strokec2 date\cf0 \strokec4 ;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 -- Total Cases vs. Total Deaths\cf0 \cb1 \strokec4 \
\cf7 \cb3 \strokec7 -- Likelihood of dying if you contract COVID in your country\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf0 \strokec4  \cb1 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   location,\cb1 \
\cb3   \cf2 \strokec2 date\cf0 \strokec4 ,\cb1 \
\cb3   total_cases,\cb1 \
\cb3   total_deaths,\cb1 \
\cb3   \cf5 \strokec5 ((\cf0 \strokec4 total_deaths\cf5 \strokec5 /\cf0 \strokec4 total_cases\cf5 \strokec5 )*\cf6 \strokec6 100\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  covid_mortality_rate\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  location \cf2 \strokec2 LIKE\cf0 \strokec4  \cf8 \strokec8 '%States%'\cf0 \strokec4  \cb1 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   \cf2 \strokec2 AND\cf0 \cb1 \strokec4 \
\cb3   continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NOT\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  location, \cf2 \strokec2 date\cf0 \strokec4 ;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 -- Total Cases vs Population\cf0 \cb1 \strokec4 \
\cf7 \cb3 \strokec7 -- Shows the percentage of a country's population that has contracted COVID\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf0 \strokec4  \cb1 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   location,\cb1 \
\cb3   \cf2 \strokec2 date\cf0 \strokec4 ,\cb1 \
\cb3   population,\cb1 \
\cb3   total_cases,\cb1 \
\cb3   \cf5 \strokec5 ((\cf0 \strokec4 total_cases\cf5 \strokec5 /\cf0 \strokec4 population\cf5 \strokec5 )*\cf6 \strokec6 100\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  covid_infection_percentage\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  location \cf2 \strokec2 LIKE\cf0 \strokec4  \cf8 \strokec8 '%States%'\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   \cf2 \strokec2 AND\cf0 \cb1 \strokec4 \
\cb3   continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NOT\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  location, \cf2 \strokec2 date\cf0 \strokec4  \cf2 \strokec2 DESC\cf0 \strokec4 ;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 -- New Cases per Capita\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   location,\cb1 \
\cb3   \cf2 \strokec2 date\cf0 \strokec4 ,\cb1 \
\cb3   population,\cb1 \
\cb3   new_cases,\cb1 \
\cb3   \cf5 \strokec5 (\cf0 \strokec4 new_cases\cf5 \strokec5 /\cf0 \strokec4 population\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  new_cases_per_capita\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NOT\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  new_cases_per_capita \cf2 \strokec2 DESC\cf0 \strokec4 ;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 -- Looking at Countries with Highest Infection Rate\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   location,\cb1 \
\cb3   population,\cb1 \
\cb3   \cf2 \strokec2 MAX\cf5 \strokec5 (\cf0 \strokec4 total_cases\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  highest_infection_count,\cb1 \
\cb3   \cf2 \strokec2 MAX\cf5 \strokec5 ((\cf0 \strokec4 total_cases\cf5 \strokec5 /\cf0 \strokec4 population\cf5 \strokec5 )*\cf6 \strokec6 100\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  percent_population_infected\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NOT\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 GROUP\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  location, population\cb1 \
\cf2 \cb3 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  percent_population_infected \cf2 \strokec2 DESC\cf0 \strokec4 ;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 -- Showing Countries with Highest Death Count Per Population\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   location,\cb1 \
\cb3   \cf2 \strokec2 MAX\cf5 \strokec5 (\cf2 \strokec2 cast\cf5 \strokec5 (\cf0 \strokec4 total_deaths \cf2 \strokec2 AS\cf0 \strokec4  INT\cf5 \strokec5 ))\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  total_death_count\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NOT\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 GROUP\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  location\cb1 \
\cf2 \cb3 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  total_death_count \cf2 \strokec2 DESC\cf0 \strokec4 ;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 -- Breaking Total Deaths Down by Continent\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   location,\cb1 \
\cb3   \cf2 \strokec2 MAX\cf5 \strokec5 (\cf2 \strokec2 cast\cf5 \strokec5 (\cf0 \strokec4 total_deaths \cf2 \strokec2 AS\cf0 \strokec4  INT\cf5 \strokec5 ))\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  total_death_count\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 GROUP\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  location\cb1 \
\cf2 \cb3 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  total_death_count \cf2 \strokec2 DESC\cf0 \strokec4 ;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 -- Global Numbers\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   \cf2 \strokec2 SUM\cf5 \strokec5 (\cf0 \strokec4 new_cases\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  total_cases,\cb1 \
\cb3   \cf2 \strokec2 SUM\cf5 \strokec5 (\cf0 \strokec4 new_deaths\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  total_deaths,\cb1 \
\cb3   \cf5 \strokec5 (\cf2 \strokec2 SUM\cf5 \strokec5 (\cf0 \strokec4 new_deaths\cf5 \strokec5 )/\cf2 \strokec2 SUM\cf5 \strokec5 (\cf0 \strokec4 new_cases\cf5 \strokec5 )*\cf6 \strokec6 100\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  death_percentage\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NOT\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  \cf6 \strokec6 1\cf0 \strokec4 ,\cf6 \strokec6 2\cf0 \strokec4 ;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 -- Looking at Total Population vs. Vaccination\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   dea.continent,\cb1 \
\cb3   dea.location,\cb1 \
\cb3   dea.\cf2 \strokec2 date\cf0 \strokec4 ,\cb1 \
\cb3   dea.population,\cb1 \
\cb3   vac.new_vaccinations,\cb1 \
\cb3   \cf2 \strokec2 SUM\cf5 \strokec5 (\cf0 \strokec4 vac.new_vaccinations\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 OVER\cf0 \strokec4  \cf5 \strokec5 (\cf2 \strokec2 PARTITION\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  dea.location \cf2 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  dea.location, dea.\cf2 \strokec2 date\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  rolling_people_vaccinated,\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.covidvaccinations vac\cb1 \
\cf2 \cb3 \strokec2 JOIN\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths dea\cb1 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   \cf2 \strokec2 ON\cf0 \strokec4  vac.\cf9 \strokec9 location\cf0 \strokec4  = dea.location\cb1 \
\cb3   \cf2 \strokec2 AND\cf0 \strokec4  vac.\cf9 \strokec9 date\cf0 \strokec4  = dea.\cf2 \strokec2 date\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  vac.continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NOT\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  \cf6 \strokec6 1\cf0 \strokec4 ,\cf6 \strokec6 2\cf0 \strokec4 ;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 -- Temp Table\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 BEGIN\cf0 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 CREATE\cf0 \strokec4  \cf2 \strokec2 TEMP\cf0 \strokec4  \cf2 \strokec2 TABLE\cf0 \strokec4  percentpopulationvaccinated\cb1 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 (\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   continent \cf2 \strokec2 string\cf0 \strokec4 ,\cb1 \
\cb3   location \cf2 \strokec2 string\cf0 \strokec4 ,\cb1 \
\cb3   \cf2 \strokec2 date\cf0 \strokec4  \cf2 \strokec2 datetime\cf0 \strokec4 ,\cb1 \
\cb3   population numeric,\cb1 \
\cb3   rolling_people_vaccinated numeric\cb1 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 )\cf0 \strokec4 ;\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 INSERT\cf0 \strokec4  \cf2 \strokec2 INTO\cf0 \strokec4  percentpopulationvaccinated\cb1 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3  \cf2 \strokec2 SELECT\cf0 \cb1 \strokec4 \
\cb3     dea.continent,\cb1 \
\cb3     dea.location,\cb1 \
\cb3     dea.\cf2 \strokec2 date\cf0 \strokec4 ,\cb1 \
\cb3     dea.population,\cb1 \
\cb3     \cf2 \strokec2 SUM\cf5 \strokec5 (\cf0 \strokec4 vac.new_vaccinations\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 OVER\cf0 \strokec4  \cf5 \strokec5 (\cf2 \strokec2 PARTITION\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  dea.location \cf2 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  dea.location, dea.\cf2 \strokec2 date\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  rolling_people_vaccinated,\cb1 \
\cb3   \cf2 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.covidvaccinations vac\cb1 \
\cb3   \cf2 \strokec2 JOIN\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths dea\cb1 \
\cb3     \cf2 \strokec2 ON\cf0 \strokec4  vac.\cf9 \strokec9 location\cf0 \strokec4  = dea.location\cb1 \
\cb3     \cf2 \strokec2 AND\cf0 \strokec4  vac.\cf9 \strokec9 date\cf0 \strokec4  = dea.\cf2 \strokec2 date\cf0 \strokec4 ;\cb1 \
\cb3   \cf7 \strokec7 --WHERE vac.continent IS NOT NULL\cf0 \cb1 \strokec4 \
\cb3   \cf2 \strokec2 END\cf0 \strokec4 ;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   \cf5 \strokec5 *\cf0 \strokec4 ,\cb1 \
\cb3   \cf5 \strokec5 (\cf0 \strokec4 rolling_people_vaccinated\cf5 \strokec5 /\cf0 \strokec4 population\cf5 \strokec5 )\cf0 \strokec4  \cf5 \strokec5 *\cf0 \strokec4  \cf6 \strokec6 100\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf0 \strokec4  percentpopulationvaccinated;\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \cb3 \strokec7 -- Create View to store data for later visualizations\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3  \cf2 \strokec2 CREATE\cf0 \strokec4  \cf2 \strokec2 VIEW\cf0 \strokec4  covidanalysis.viewpopulationvaccinated \cf2 \strokec2 AS\cf0 \cb1 \strokec4 \
\cb3  \cf2 \strokec2 SELECT\cf0 \cb1 \strokec4 \
\cb3     dea.continent,\cb1 \
\cb3     dea.location,\cb1 \
\cb3     dea.\cf2 \strokec2 date\cf0 \strokec4 ,\cb1 \
\cb3     dea.population,\cb1 \
\cb3     \cf2 \strokec2 SUM\cf5 \strokec5 (\cf0 \strokec4 vac.new_vaccinations\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 OVER\cf0 \strokec4  \cf5 \strokec5 (\cf2 \strokec2 PARTITION\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  dea.location \cf2 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  dea.location, dea.\cf2 \strokec2 date\cf5 \strokec5 )\cf0 \strokec4  \cf2 \strokec2 AS\cf0 \strokec4  rolling_people_vaccinated,\cb1 \
\cb3   \cf2 \strokec2 FROM\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.covidvaccinations vac\cb1 \
\cb3   \cf2 \strokec2 JOIN\cf0 \strokec4  covidanalysis\cf5 \strokec5 -\cf6 \strokec6 376007\cf0 \strokec4 .covidanalysis.coviddeaths dea\cb1 \
\cb3     \cf2 \strokec2 ON\cf0 \strokec4  vac.\cf9 \strokec9 location\cf0 \strokec4  = dea.location\cb1 \
\cb3     \cf2 \strokec2 AND\cf0 \strokec4  vac.\cf9 \strokec9 date\cf0 \strokec4  = dea.\cf2 \strokec2 date\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 WHERE\cf0 \strokec4  vac.continent \cf2 \strokec2 IS\cf0 \strokec4  \cf2 \strokec2 NOT\cf0 \strokec4  \cf2 \strokec2 NULL\cf0 \strokec4 ;\cb1 \
\
\cf2 \cb3 \strokec2 EXPORT\cf0 \strokec4  \cf2 \strokec2 DATA\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   \cf2 \strokec2 OPTIONS\cf0 \strokec4  \cf5 \strokec5 (\cf0 \cb1 \strokec4 \
\cb3     \cf9 \strokec9 uri\cf0 \strokec4  = \cf8 \strokec8 'gs://bucket/folder/*.csv'\cf0 \strokec4 ,\cb1 \
\cb3     \cf9 \strokec9 format\cf0 \strokec4  = \cf8 \strokec8 'CSV'\cf0 \strokec4 ,\cb1 \
\cb3     \cf9 \strokec9 overwrite\cf0 \strokec4  = \cf2 \strokec2 true\cf0 \strokec4 ,\cb1 \
\cb3     \cf9 \strokec9 header\cf0 \strokec4  = \cf2 \strokec2 true\cf0 \strokec4 ,\cb1 \
\cb3     \cf9 \strokec9 field_delimiter\cf0 \strokec4  = \cf8 \strokec8 ';'\cf5 \strokec5 )\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 AS\cf0 \strokec4  \cf5 \strokec5 (\cf0 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb3   \cf2 \strokec2 SELECT\cf0 \strokec4  field1, field2\cb1 \
\cb3   \cf2 \strokec2 FROM\cf0 \strokec4  mydataset.table1\cb1 \
\cb3   \cf2 \strokec2 ORDER\cf0 \strokec4  \cf2 \strokec2 BY\cf0 \strokec4  field1\cb1 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 )\cf0 \strokec4 ;\cb1 \
}