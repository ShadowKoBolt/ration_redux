json.extract! recipe, :id, :name, :user_id, :serves, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
