class Recipe < ApplicationRecord
  include Edible

  belongs_to :user
  has_many :ingredients, dependent: :destroy

  def as_json(options={})
    options[:methods] ||= [:type_and_id]
    super(options)
  end
end
