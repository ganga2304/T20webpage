class Team < ApplicationRecord
    validates :name, :country, :founded, presence: true
    validates :name, uniqueness: true
    validates :founded, numericality: { greater_than: 1901 }
    has_many :players, dependent: :destroy
    has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id'
    has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_id'
    scope :from_country, ->(country) { where(country: country) }
    scope :founded_after, ->(year) { where("founded_at > ?", year) }
  end
