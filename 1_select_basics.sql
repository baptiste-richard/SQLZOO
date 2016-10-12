# 1. show the population of Germany
SELECT population FROM world
 WHERE name = 'Germany'

# 2. show the name and the population for 'Ireland', 'Iceland' and 'Denmark'
SELECT name, population FROM world
 WHERE name IN ('Ireland', 'Iceland', 'Denmark')
 
# 3. show the country and the area for countries with an area between 200,000 and 250,000
SELECT name, area FROM world
 WHERE area BETWEEN 200000 AND 250000

# 4. (QUIZZ) show the countries that end in A or L
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'
 
# 5. (QUIZZ) show countries in Europe with only 5 letters in their name
SELECT name, LENGTH(name) FROM world
 WHERE LENGTH(name)=5 AND region='Europe'
