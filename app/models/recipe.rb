class Recipe < ApplicationRecord
  include Edible

  belongs_to :user
  has_many :ingredients, dependent: :destroy
end
