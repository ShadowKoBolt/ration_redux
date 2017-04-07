class Food < ApplicationRecord
  include Edible

  belongs_to :user

  validates :name, :unit, presence: true
  validates :name, uniqueness: true

  def name_with_unit
    "#{name} (#{unit})"
  end
end
