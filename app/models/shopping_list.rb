class ShoppingList
  def initialize(plan)
    @plan = plan
  end

  def items
    items = {}
    @plan.meals.each do |meal|
      if meal.edible.is_a?(Food)
        if items.has_key?(meal.edible)
          items[meal.edible] += meal.amount
        else
          items[meal.edible] = meal.amount
        end
      else
        meal.edible.ingredients.each do |ingredient|
          if items.has_key?(ingredient.food)
            items[ingredient.food] += (ingredient.amount * meal.amount)
          else
            items[ingredient.food] = (ingredient.amount * meal.amount)
          end
        end
      end
    end
    items.sort_by { |food, _amount| food.name }
  end
end
