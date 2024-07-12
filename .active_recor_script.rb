require_relative 'config/environment'
# Retrieve all players of a specific team.
teams = Team.find(1)
 teams.players

# Retrieve players older than a certain age.
players = Player.where("age > ?", 30)
players

#Insert a new player into a team.
players = Player.create(name: "player31",age: 34,position: "Forword",team_id: 2);

# Update a player's position.
players = Player.find(31)
players.update(position: :'Defender')

# Delete a player by their name.
players = Player.find_by(name: "player31")
players.destroy

# Get the count of players in each team including teams without any
# players.
teams = Team.all
teams.each do |team|
   puts "#{team.name} has #{team.players.count} players"
end
# Retrieve matches along with the names of both teams.
matches = Match.all
matches.each do |match|
   puts "#{match.home_team.name} vs #{match.away_team.name}"
end
# Get the sum of scores for each team in all matches.
matches = Match.all
matches.each do |match|
   puts "#{match.home_team.name} : #{match.home_team_score}"
   puts "#{match.away_team.name} : #{match.away_team_score}"
end

# Filter teams with more than a certain number of players.
teams = Team.all
teams.each do |team|
   if team.players.count > 10
      puts "#{team.name}  more than 4 players"
   else
      puts "Error having"
      team.error
   end
end

 # Retrieve the average age of players in each team.
teams = Team.all
  teams.each do |team|
   puts "#{team.name} average age of #{team.players.average(:age)}"
end

