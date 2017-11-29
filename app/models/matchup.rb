class Matchup < ApplicationRecord
  belongs_to :char_as, class_name: 'Character', foreign_key: 'char_as_id'
  belongs_to :char_against, class_name: 'Character', foreign_key: 'char_against_id'
  has_many :matchup_items

  validates_presence_of :char_as_id, :char_against_id
  validates_uniqueness_of :char_as_id, scope: :char_against_id
end
