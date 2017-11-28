class CreateMatchupItems < ActiveRecord::Migration[5.1]
  def change
    create_table :matchup_items do |t|
      t.integer :matchup_id
      t.text :description

      t.timestamps
    end

    add_index :matchup_items, :matchup_id
    add_foreign_key :matchup_items, :matchups
  end
end
