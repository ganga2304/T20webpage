require 'csv'
class Cricket

  #process data method
  def process_data(sampleDataFile)
    @players = {}
    @max_strike_rate = 0
    @max_strike_rate_player = ''
    @total_runs = 0
    @total_balls = 0
    @max_fours = 0
    @max_sixes = 0
    @max_fours_player = ''
    @max_sixes_player = ''
    CSV.foreach(sampleDataFile, headers: true) do |row|
    begin
        player_name = row['Player name']
        runs = row['Runs scored'].to_i
        balls = row['Balls faced'].to_i
        fours = row['Number of fours'].to_i
        sixes = row['Number of sixes'].to_i
        @total_runs += runs
        @total_balls += balls
        strike_rate = runs.to_f / balls

        if fours > @max_fours
          @max_fours = fours
          @max_fours_player = player_name
        end

        if sixes > @max_sixes
          @max_sixes = sixes
          @max_sixes_player = player_name
        end

        if strike_rate > @max_strike_rate
          @max_strike_rate = strike_rate
          @max_strike_rate_player = player_name
        end

        @players[player_name] = {
          strike_rate: strike_rate,
          fours: fours,
          sixes: sixes
        }

    rescue => e
        puts "Error processing row: #{e.message}"
      end
    end
  end

  # print_Data method
    def print_data
    @players.each do |player, cricketObj|
      puts "Strike rate of #{player} is #{cricketObj[:strike_rate]}"
      
    end

  #printing total  values of player 

    puts "Player with highest strike rate is #{@max_strike_rate_player} with #{@max_strike_rate}"
    puts "Total runs scored by all players is #{@total_runs}"
    puts "Total balls faced by all players is #{@total_balls}"
    puts "Player with most fours is #{@max_fours_player} with #{@max_fours}"
    puts "Player with most sixes is #{@max_sixes_player} with #{@max_sixes}"
  end
end
#calling the methods 
cricketObj = Cricket.new
cricketObj.process_data('Script/sample_cricket_stats.csv')
cricketObj.print_data