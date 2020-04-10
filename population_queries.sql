-- How many entries in the database are from Africa?
SELECT COUNT(*)
FROM countries
WHERE continent = 'Africa';

-- What was the total population of Oceania in 2005?
SELECT year, continent, SUM(population)
FROM countries
LEFT JOIN population_years
    ON countries.id = population_years.country_id
GROUP BY year, continent
HAVING continent = 'Oceania' AND year = '2005';





-- What is the average population of countries in South America in 2003?
SELECT name, AVG(population)
FROM population_years
LEFT JOIN countries
    ON population_years.country_id = countries.id
GROUP BY name
HAVING continent = 'South America';


-- What country had the smallest population in 2007?
SELECT name, MIN(population)
FROM countries
LEFT JOIN population_years
    ON countries.id = population_years.country_id
GROUP BY name
HAVING year = '2007';



-- What is the average population of Poland during the time period covered by this dataset?
SELECT name, AVG(population)
FROM countries
LEFT JOIN population_years
 ON countries.id = population_years.country_id
GROUP BY name
HAVING name = 'Poland';


-- How many countries have the word "The" in their name?
SELECT COUNT(*)
FROM countries
WHERE name LIKE '%The%';

-- What was the total population of each continent in 2010?

SELECT continent,year, SUM(population)
FROM population_years
LEFT JOIN countries
    ON population_years.country_id = countries.id
GROUP BY continent, year
HAVING year = '2010';
