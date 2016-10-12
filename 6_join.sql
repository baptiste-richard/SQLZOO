# 1. show the matchid and player name for all goals scored by Germany
SELECT matchid, player FROM goal 
WHERE teamid = 'GER'

# 2. show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2 FROM game
WHERE id = 1012

# 3. show the player, teamid, stadium and mdate and for every German goal
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

# 4. show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
FROM game JOIN goal ON (id = matchid)
WHERE player LIKE 'Mario%'

# 5. show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON id=teamid
WHERE gtime <= 10

# 6. list the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach
SELECT mdate, teamname 
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'

# 7. list the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM goal JOIN game ON (id=matchid)
WHERE stadium = 'National Stadium, Warsaw'

# 8. show the name of all players who scored a goal against Germany
SELECT DISTINCT(player)
FROM game JOIN goal ON matchid = id
WHERE teamid!='GER' AND (team1 = 'GER' OR team2 = 'GER') 

# 9. show teamname and the total number of goals scored
SELECT teamname, COUNT(player)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

# 10. show the stadium and the number of goals scored in each stadium
SELECT stadium, COUNT(matchid)
FROM game JOIN goal ON (id = matchid)
GROUP BY stadium

# 11. for every match involving 'POL', show the matchid, date and the number of goals scored
SELECT id, mdate, COUNT(player)
FROM game JOIN goal ON (id = matchid)
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY id, mdate

# 12. for every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT id, mdate, COUNT(player)
FROM game JOIN goal ON game.id = goal.matchid
WHERE teamid = 'GER'
GROUP BY id, mdate

# 13. (QUIZZ) shows players, their team and the amount of goals they scored against Greece(GRE)
SELECT player, teamid, COUNT(*) FROM game JOIN goal ON matchid = id
WHERE (team1 = "GRE" OR team2 = "GRE") AND teamid != 'GRE'
GROUP BY player, teamid

# 14. (QUIZZ) show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw
SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
WHERE stadium = 'National Stadium, Warsaw' 
   AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'

# 15. (QUIZZ) shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA)
SELECT DISTINCT player, teamid, gtime
   FROM game JOIN goal ON matchid = id
WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))
