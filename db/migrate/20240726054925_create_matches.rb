class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.date :date
      t.string :location
      t.integer :home_team_id,null:false
      t.integer :away_team_id,null:false
      t.timestamps
    end
  end
end
