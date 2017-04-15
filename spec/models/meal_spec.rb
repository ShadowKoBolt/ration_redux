require 'rails_helper'

RSpec.describe Meal, type: :model do
  it { is_expected.to validate_presence_of(:edible) }
  it { is_expected.to validate_presence_of(:slot) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_numericality_of(:amount) }
end
