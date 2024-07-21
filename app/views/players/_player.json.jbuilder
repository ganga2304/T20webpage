json.extract! player, :id, :name, :role, :is_captain, :is_active, :description, :created_at, :updated_at
json.url player_url(player, format: :json)
