json.extract! food, :id, :user_id, :name, :unit, :created_at, :updated_at
json.url food_url(food, format: :json)
