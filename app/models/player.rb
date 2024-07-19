class Player < ApplicationRecord
    belongs_to :team
    validates :name,presence: true
    validates :age,presence: true 
    validates :position,presence: true
    validates :description,presence: true
    
end
