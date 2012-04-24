class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.integer :role_id
      t.text :need
      t.text :goal

      t.timestamps
    end
  end
end
