class CreateMatchups < ActiveRecord::Migration[5.1]
  def change
    create_table :matchups do |t|
      t.integer :char_as_id
      t.integer :char_against_id

      t.timestamps
    end

    add_index :matchups, :char_as_id
    add_index :matchups, :char_against_id

    add_foreign_key :matchups, :characters, column: :char_as_id
    add_foreign_key :matchups, :characters, column: :char_against_id
  end
end
