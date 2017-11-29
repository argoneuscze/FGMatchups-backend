require 'rails_helper'

RSpec.describe Matchup, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:matchup)).to be_valid
  end

  context 'when validating fields' do
    it { is_expected.to validate_presence_of :char_as_id }
    it { is_expected.to validate_presence_of :char_against_id }

    it 'should validate uniqueness of matchups' do
      m1 = FactoryBot.create(:matchup)
      m2 = FactoryBot.build(:matchup, char_as: m1.char_as, char_against: m1.char_against)
      expect(m2).not_to be_valid
    end
  end

  context 'when validating relations' do
    it { is_expected.to belong_to(:char_as).class_name('Character').with_foreign_key('char_as_id') }
    it { is_expected.to belong_to(:char_against).class_name('Character').with_foreign_key('char_against_id') }
    it { is_expected.to have_many :matchup_items }
  end
end
