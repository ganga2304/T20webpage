class Match < ApplicationRecord
  validates :date, :location, :home_team_id, :away_team_id, presence: true
  validates :home_team_id, :away_team_id, numericality: true
  validate :teams_must_be_different
  validate :date_cannot_be_in_the_past
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  has_many :players
  before_save :check_date
  after_create :log_creation
  scope :upcoming, -> { where("date > ?", Date.current) }
  scope :for_team, ->(team) { where(team: team) }
  scope :within_date_range, ->(start_date, end_date) { where("date BETWEEN ? AND ?", start_date, end_date) }

  private

  def check_date
    if date < Date.current
      errors.add(:base, "Date cannot be in the past")
      throw(:abort)
    end
  end

  def log_creation
    puts("Match created: #{id}")
  end

  def teams_must_be_different
    errors.add(:away_team_id, 'cannot be the same as home team') if home_team_id == away_team_id
  end

  def date_cannot_be_in_the_past
    errors.add(:date, 'cannot be in the past') if date < Date.today
  end
end
