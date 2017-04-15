class Plan < ApplicationRecord
  belongs_to :user
  has_many :days, -> { order(position: :asc) }, dependent: :destroy
  has_many :meals, through: :days

  acts_as_list
end
