# 1. list the films where the yr is 1962 [Show id, title]
SELECT id, title FROM movie
WHERE yr = 1962

# 2. give year of 'Citizen Kane'
SELECT yr FROM movie
WHERE title = 'Citizen Kane'

# 3. list all of the Star Trek movies, include the id, title and yr. Order results by year
SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

# 4. what are the titles of the films with id 11768, 11955, 21191
SELECT title FROM movie
WHERE id IN (11768, 11955, 21191)

# 5. what id number does the actress 'Glenn Close' have?
SELECT id FROM actor
WHERE name = 'Glenn Close'

# 6. what is the id of the film 'Casablanca'?
SELECT id FROM movie
WHERE title = 'Casablanca'

# 7. using previous question, obtain the cast list for 'Casablanca'
SELECT actor.name 
FROM actor JOIN casting ON (actor.id = casting.actorid)
WHERE movieid = 11768

# 8. obtain the cast list for the film 'Alien'
SELECT actor.name 
FROM actor JOIN casting ON (actor.id = casting.actorid)
WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien')

# 9. list the films in which 'Harrison Ford' has appeared
SELECT title 
FROM movie JOIN casting ON (movie.id = casting.movieid)
WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')

# 10. list the films where 'Harrison Ford' has appeared - but not in the starring role. [If ord=1 then this actor is in the starring role]
SELECT movie.title
FROM movie JOIN casting ON (movie.id = casting.movieid)
WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') AND ord <> 1

# 11. list the films together with the leading star for all 1962 films
SELECT title, name 
   FROM movie JOIN casting ON (movie.id=casting.movieid) 
              JOIN actor ON (casting.actorid=actor.id) 
WHERE movie.yr = 1962 AND casting.ord = 1

# 12. busiest years for 'John Travolta', show the year and the number of movies he made each year for any year in which he made more than 2 movies
SELECT yr, COUNT(title) 
   FROM movie JOIN casting ON (movie.id=casting.movieid)
              JOIN actor ON (casting.actorid=actor.id)
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) 
   FROM (SELECT yr,COUNT(title) AS c 
   FROM movie JOIN casting ON movie.id=casting.movieid
              JOIN actor ON casting.actorid=actor.id
   WHERE name='John Travolta'
   GROUP BY yr) AS t)
   
# 13. list the film title and the leading actor for all of the films 'Julie Andrews' played in
SELECT title, name
FROM (movie JOIN casting ON movie.id=movieid) JOIN actor ON actor.id=actorid
WHERE ord=1 AND title IN(SELECT title
FROM (movie JOIN casting ON movie.id=movieid) JOIN actor ON actor.id=actorid
WHERE name='Julie Andrews')
ORDER BY name

# 14. Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles
SELECT name FROM movie JOIN casting ON (movie.id=movieid)
                       JOIN actor on (actor.id=actorid) 
WHERE ord=1
GROUP BY name
HAVING COUNT(name) >= 30
