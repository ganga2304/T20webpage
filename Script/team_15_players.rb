class CricketTeam
  attr_accessor :players_data

  def initialize
    @players_data = []
  end

  def player(name, runs, wickets)
    @players_data << { name: name, runs: runs, wickets: wickets }
  end

  def all_players_data
    @players_data.map { |player| "#{player[:name]}  #{player[:runs]} #{player[:wickets]}" }
  end
end

#object Creation
team = CricketTeam.new
team.player("Rahul Dravid", 600, 10)
team.player("Sunil Gavaskar", 1400, 5)
team.player("Virat Kohli", 8000, 2)
team.player("VVS Laxman", 2000, 1)
team.player("Virender Sehwag", 2000, 15)
team.player("Sourav Gangly", 1800, 20)
team.player("Cheteshwar Pujara", 3000, 30)
team.player("Dilip Vengsarkar", 300, 40)
team.player("Mohammad Azharuddin", 400, 35)
team.player("Gundappa Viswanath", 300, 25)
team.player("Kapil Dev", 200, 20)
team.player("Ajinkya Rahane", 150, 15)
team.player("MS Dhoni", 100, 10)
team.player("Mohinder Amarnath", 50, 5)
team.player("Gautam Gambhir", 25, 2)


puts team.all_players_data