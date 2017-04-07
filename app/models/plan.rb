class Plan < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy

  acts_as_list
end
