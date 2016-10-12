# 1. show name, continent, population from all countries
SELECT name, continent, population FROM world

# 2. show the name for the countries that have a population of at least 200 million
SELECT name FROM world
WHERE population > 200000000

# 3. give the name and the per capita GDP for those countries with a population of at least 200 million
SELECT name, (gdp/population) FROM world
WHERE population > 200000000

# 4. show the name and population in millions for the countries of the continent 'South America'
SELECT name, (population/1000000) FROM world
WHERE continent = 'South America'

# 5. show the name and population for France, Germany, Italy
SELECT name, population FROM world
WHERE name IN ('France','Germany','Italy')

# 6. show the countries which have a name that includes the word 'United'
SELECT name FROM world
WHERE name LIKE 'United%' OR '%United'

# 7. show the countries that are big by area or big by population. Show name, population and area
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000

# 8. show the countries that are big by area or big by population but not both. Show name, population and area 
SELECT name, population, area FROM world
WHERE (area > 3000000 AND population < 250000000) OR (population > 250000000 AND area < 3000000)

# 9. for South America show population in millions and GDP in billions both to 2 decimal places
SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) FROM world
WHERE continent = 'South America'

# 10. show per-capita GDP for the trillion dollar countries to the nearest $1000
SELECT name, ROUND(gdp/(population*1000),0)*1000 FROM world
WHERE gdp > 1000000000000

# 11. show the name - but substitute Australasia for Oceania - for countries beginning with N
SELECT name,
   CASE WHEN continent='Oceania' THEN 'Australasia'
      ELSE continent END
FROM world
WHERE name LIKE 'N%'

# 12. show the name and the continent - but substitute Eurasia for Europe and Asia; substitute America - for each country in North America or South America or Caribbean. Show countries beginning with A or B
SELECT name,
   CASE WHEN continent = 'Europe' THEN 'Eurasia'
        WHEN continent = 'Asia' THEN 'Eurasia'
        WHEN continent = 'North America' THEN 'America'
        WHEN continent = 'South America' THEN 'America'
        WHEN continent = 'Caribbean' THEN 'America'
        ELSE continent END
FROM world
WHERE name LIKE 'A%' OR name LIKE 'B%'

# 13. put the continents right: Oceania becomes Australasia, Countries in Eurasia and Turkey go to Europe/Asia, Caribbean islands starting with 'B' go to North America, other Caribbean islands go to South America, 
# Order by country name in ascending order, Test your query using the WHERE clause with the following:WHERE tld IN ('.ag','.ba','.bb','.ca','.cn','.nz','.ru','.tr','.uk')
SELECT name,continent,
   CASE WHEN continent = 'Eurasia' THEN 'Europe/Asia'
        WHEN name = 'Turkey' THEN 'Europe/Asia'
        WHEN continent = 'Caribbean' AND name LIKE 'B%' THEN 'North America'
        WHEN continent = 'Caribbean' AND name NOT LIKE '%B' THEN 'South America'
        WHEN continent = 'Oceania' THEN 'Australasia'
        ELSE continent END
FROM world
WHERE tld IN ('.ag','.ba','.bb','.ca','.cn','.nz','.ru','.tr','.uk')
ORDER BY name

# 14. (QUIZZ) give the name of countries beginning with U
SELECT name FROM world
WHERE name LIKE 'U%'

# 15. (QUIZZ) show just the population of United Kingdom
SELECT population FROM world
WHERE name = 'United Kingdom'

# 16. (QUIZZ) give name and population of countries in Europe and Asia
SELECT name, population FROM world
WHERE continent IN ('Europe', 'Asia')
