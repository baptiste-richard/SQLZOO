# 1. display Nobel prizes for 1950
SELECT yr, subject, winner FROM nobel
WHERE yr = 1950

# 2. show who won the 1962 prize for Literature
SELECT winner FROM nobel
WHERE yr = 1962 AND subject = 'Literature'

# 3. show the year and subject that won 'Albert Einstein' his prize
SELECT yr, subject FROM nobel
WHERE winner = 'Albert Einstein'

# 4. give the name of the 'Peace' winners since the year 2000, including 2000
SELECT winner FROM nobel
WHERE subject = 'Peace' AND yr > 1999

# 5. show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive
SELECT yr, subject, winner FROM nobel
WHERE subject = 'Literature' AND yr > 1979 AND yr < 1990

# 6. show all details of the presidential winners: Theodore Roosevelt, Woodrow Wilson, Jimmy Carter
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter')

# 7. show the winners with first name John
SELECT winner FROM nobel
WHERE winner LIKE 'John%'

# 8. show the Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT yr, subject, winner FROM nobel
WHERE (yr = 1980 AND subject = 'Physics') OR (yr = 1984 AND subject = 'Chemistry')

# 9. show the winners for 1980 excluding the Chemistry and Medicine
SELECT yr, subject, winner FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry','Medicine')

# 10. show who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT yr, subject, winner FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr > 2003)

# 11. find all details of the prize won by PETER GRÜNBERG
SELECT yr, subject, winner FROM nobel
WHERE winner = 'PETER GRÜNBERG'

# 12. find all details of the prize won by EUGENE O'NEILL
SELECT yr, subject, winner FROM nobel
WHERE winner = "EUGENE O'NEILL"

# 13. list the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner 

# 14. show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last
# 'subject IN' will create a new column with 0 and 1 depending on the given arguments, just ORDER BY using this newly created column
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject, winner

# 15. (QUIZZ) show the name of winner's names beginning with C and ending in n
SELECT winner FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n'

# 16. (QUIZZ) show how many Chemistry awards were given between 1950 and 1960
SELECT COUNT(subject) FROM nobel
WHERE subject = 'Chemistry' AND yr BETWEEN 1950 AND 1960

# 17. (QUIZZ) show the amount of years where no Medicine awards were given
SELECT COUNT(DISTINCT yr) FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

# 18. (QUIZZ) show the year when neither a Physics or Chemistry award was given
SELECT yr FROM nobel
WHERE yr NOT IN(SELECT yr 
                FROM nobel
                WHERE subject IN ('Chemistry','Physics'))
                
# 19. show the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr FROM nobel
WHERE subject = 'Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                 WHERE subject='Literature')
   AND yr NOT IN(SELECT yr FROM nobel
                 WHERE subject='Peace')
