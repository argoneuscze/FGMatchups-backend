class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :short_name
end
