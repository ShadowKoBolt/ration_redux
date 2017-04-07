require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#initial" do
    subject { FactoryGirl.build(:user, email: 'user@example.com').initial }

    it { is_expected.to eq('U') }
  end
end
