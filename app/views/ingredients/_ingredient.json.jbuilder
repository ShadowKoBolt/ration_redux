json.extract! ingredient, :id, :recipe_id, :food_id, :amount, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
