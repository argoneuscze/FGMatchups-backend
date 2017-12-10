class MatchupSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :char_as
  belongs_to :char_against
  has_many :matchup_items
end
