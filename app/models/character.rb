class Character < ApplicationRecord
  has_many :matchups, foreign_key: 'char_as_id'

  validates_presence_of :full_name, :short_name
end
