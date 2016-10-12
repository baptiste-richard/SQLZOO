# 1. list each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
WHERE population >
   (SELECT population FROM world WHERE name='Russia')
   
# 2. show the countries in Europe with a per capita GDP greater than 'United Kingdom'
SELECT name FROM world
WHERE (gdp/population) > 
   (SELECT(gdp/population) FROM world WHERE name = 'United Kingdom')
   AND continent = 'Europe'

# 3. list the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country
SELECT name, continent FROM world
WHERE continent IN 
   (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name

# 4. show name and population of country that has a population that is more than Canada but less than Poland
SELECT name, population FROM world 
WHERE population > 
   (SELECT population FROM world WHERE name = 'Canada')
   AND population < 
      (SELECT population FROM world WHERE name = 'Poland')
      
# 5. show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name='Germany'),0),'%') FROM world
WHERE continent = 'Europe'

# 6. Which countries have a GDP greater than every country in Europe? (Some countries may have NULL gdp values)
# add gdp > 0 to get rid of NULL entries
SELECT name FROM world 
WHERE gdp > 
   ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0)

# 7. find the largest country (by area) in each continent, show the continent, the name and the area
# with x and y refer to values in the outer SELECT within the inner SELECT
SELECT continent, name, area FROM world x
WHERE area >= 
   ALL(SELECT area FROM world y WHERE y.continent=x.continent AND area>0)

# 8. list each continent and the name of the country that comes first alphabetically
SELECT continent, name FROM world x
WHERE name <= 
   ALL(SELECT name FROM world y WHERE x.continent = y.continent)
