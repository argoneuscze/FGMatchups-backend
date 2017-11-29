class AddUniqueIndices < ActiveRecord::Migration[5.1]
  def change
    remove_index :matchups, :char_as_id
    remove_index :matchups, :char_against_id

    add_index :matchups, [:char_as_id, :char_against_id], unique: true
    add_index :matchups, [:char_against_id, :char_as_id], unique: true
  end
end
