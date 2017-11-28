class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :short_name
      t.string :full_name

      t.timestamps
    end
  end
end
