class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.integer :position, default: 1, null: false

      t.timestamps
    end

    add_index :categories, :slug, unique: true
    add_index :categories, :position, unique: true
  end
end
