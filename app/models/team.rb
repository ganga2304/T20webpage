class Team < ApplicationRecord
    has_many :players
    validates :name,presence: true
    validates :country,presence: true
    validates :description,presence: true
end
