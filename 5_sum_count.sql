# 1. show the total population of the world
SELECT SUM(population)
FROM world

# 2. list all the continents - just once each
SELECT DISTINCT(continent) FROM world

# 3. give the total GDP of Africa
SELECT SUM(gdp) FROM world
WHERE continent = 'Africa'

# 4. how many countries have an area of at least 1000000
SELECT COUNT(name) FROM world
WHERE area > 1000000

# 5. what is the total population of ('France','Germany','Spain')
SELECT SUM(population) FROM world
WHERE name IN ('France','Germany','Spain')

# 6. for each continent show the continent and number of countries
SELECT continent, COUNT(name) FROM world
GROUP BY continent

# 7. for each continent show the continent and number of countries with populations of at least 10 million
SELECT continent, COUNT(name) FROM world
WHERE population > 10000000
GROUP BY continent
  
# 8. ist the continents that have a total population of at least 100 million
# always use have by after a GROUP BY when you give condition on the result of a SUM
SELECT continent FROM world
GROUP BY continent
HAVING SUM(population) > 100000000

# 9. (QUIZZ) show the sum of population of all countries in 'Europe'
SELECT SUM(population) FROM bbc WHERE region = 'Europe'

# 10. (QUIZZ) show the number of countries with population smaller than 150000  
SELECT COUNT(name) FROM bbc WHERE population < 150000

# 11. (QUIZZ) show the average population of 'Poland', 'Germany' and 'Denmark'
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

# 12. (QUIZZ) show the medium population density of each region
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

# 13. (QUIZZ) show the name and population density of the country with the largest population
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)
