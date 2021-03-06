require 'rails_helper'

RSpec.describe Food, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:unit) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
