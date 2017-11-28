class Matchup < ApplicationRecord
  belongs_to :char_as, class_name: 'Character', foreign_key: 'char_as_id'
  belongs_to :char_against, class_name: 'Character', foreign_key: 'char_against_id'
  has_many :matchup_items
end
