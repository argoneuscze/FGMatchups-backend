require 'rails_helper'

RSpec.describe Character, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:character)).to be_valid
  end

  context 'when validating fields' do
    it { is_expected.to validate_presence_of :short_name }
    it { is_expected.to validate_uniqueness_of(:short_name).case_insensitive }
    it { is_expected.to validate_presence_of :full_name }
    it { is_expected.to validate_uniqueness_of(:full_name).case_insensitive }
  end

  context 'when validating relations' do
    it { is_expected.to have_many(:matchups).dependent(:destroy) }
  end
end
