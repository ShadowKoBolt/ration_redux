class Meal < ApplicationRecord
  belongs_to :edible, polymorphic: true
  belongs_to :day

  SLOTS = ['Breakfast', 'Lunch', 'Dinner', 'Snack']

  def edible_type_and_id=(type_and_id)
    type_and_id = type_and_id.split('//')
    self.edible_type = type_and_id.first
    self.edible_id = type_and_id.last
  end

  def edible_type_and_id
    return nil unless edible
    "#{edible.model_name}//#{edible.id}"
  end
end
