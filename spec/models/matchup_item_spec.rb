require 'rails_helper'

RSpec.describe MatchupItem, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:matchup_item)).to be_valid
  end

  context 'when validating fields' do
    it { is_expected.to validate_presence_of :description }
  end

  context 'when validating relations' do
    it { is_expected.to belong_to :matchup }
  end
end
