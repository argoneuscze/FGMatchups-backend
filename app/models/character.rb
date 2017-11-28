class Character < ApplicationRecord
  has_many :matchups, foreign_key: 'char_as_id'
end
