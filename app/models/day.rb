class Day < ApplicationRecord
  belongs_to :plan
  has_many :meals, dependent: :destroy

  acts_as_list scope: [:plan_id]

  def name
    number = plan.days.order(:position).index(self) + 1
    "#{Day.model_name.human} #{number}"
  end
end
