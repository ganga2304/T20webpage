class Match < ApplicationRecord
  require 'csv'
  has_many :players
  def self.Cricket
    def initialize(path)
      @path = path
    end
    def process_data
      @data = CSV.read(@path, headers: true).map(&:to_h).map do |row|
      {
        'date' => row['date'],
        'location' => row['location'].to_i,
        'team1_id' => row['team1_id'].to_i,
        'team2_id' => row['team2_id'].to_i,
        'score_team1' => row['score_team1'].to_i,
        'score_team2' => row['score_team2'].to_i
      }
      end
    @data
  end
  def push_data
    @data = process_data
    @data.each do |player|
      Match.create(date: players['date'], location: players['location'], team1_id: players['team1_id'], team2_id: players['team2_id'], score_team1: players['score_team1'], score_team2: players['score_team2'])
    end
  end
end
# Usage
matches = Match.new('app/matches.csv')
matches.push_data
end


