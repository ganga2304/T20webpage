class Player < ApplicationRecord
    # enum role: { allrounder: 'allrounder', bowler: 'bowler', batsman: 'batsman' }
    validates :name, :age, :position, :team_id, :role, presence: true
    validates :age, numericality: true
    validates :role, inclusion: { in: %w[allrounder bowler batsman] }
    belongs_to :team
    has_many :matches
    
    before_destroy :check_captain
    after_create :update_player_count
    before_create :validate_captain

    #default_scope { where(active: true) }
    scope :by_role, ->(role) { where(role: role) }

  private

  def check_captain
    if captain?
      errors[:base] = "You cannot delete a captain"
      throw :abort
    end
  end

  def update_player_count
    team.update(player_count: team.players.count)
  end

  def validate_captain
    if team.players.where(captain: true).exists?
      errors[:base] = "Team as captain"
      throw :abort
    end
  end

end
