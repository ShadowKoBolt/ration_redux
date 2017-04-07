require 'rails_helper'

RSpec.describe Day, type: :model do
  it { is_expected.to belong_to(:plan) }
  it { is_expected.to have_many(:meals).dependent(:destroy) }

  describe '#name' do
    let(:plan) { FactoryGirl.create(:plan) }

    context 'first' do
      let(:day) { plan.days.where(position: 1).first }
      subject { day.name }
      it { is_expected.to eq('Day 1') }
    end

    context 'middle' do
      let(:day) { plan.days.where(position: 2).first }
      subject { day.name }
      it { is_expected.to eq('Day 2') }
    end

    context 'last' do
      let(:day) { plan.days.where(position: 3).first }
      subject { day.name }
      it { is_expected.to eq('Day 3') }
    end
  end
end
