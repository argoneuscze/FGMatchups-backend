class AddUniqueCharacterIndices < ActiveRecord::Migration[5.1]
  def change
    add_index :characters, :short_name, unique: true
    add_index :characters, :full_name, unique: true
  end
end
