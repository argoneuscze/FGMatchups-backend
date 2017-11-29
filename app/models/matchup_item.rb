class MatchupItem < ApplicationRecord
  belongs_to :matchup

  validates_presence_of :description
end
