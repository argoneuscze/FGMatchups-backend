require 'rails_helper'

RSpec.describe Matchup, type: :model do
  it { is_expected.to validate_presence_of :char_as_id }
  it { is_expected.to validate_presence_of :char_against_id }

  it { is_expected.to validate_uniqueness_of(:char_as_id).scoped_to(:char_against_id) }

  it { is_expected.to belong_to(:char_as).class_name('Character').with_foreign_key('char_as_id') }
  it { is_expected.to belong_to(:char_against).class_name('Character').with_foreign_key('char_against_id') }
  it { is_expected.to have_many :matchup_items }
end
