require 'rails_helper'

RSpec.describe MatchupItem, type: :model do
  it { is_expected.to validate_presence_of :description }

  it { is_expected.to belong_to :matchup }
end
