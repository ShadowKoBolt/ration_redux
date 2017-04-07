require 'rails_helper'

RSpec.describe Plan, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:days).dependent(:destroy) }
end
