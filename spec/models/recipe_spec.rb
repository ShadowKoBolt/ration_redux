require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:ingredients).dependent(:destroy) }
end
