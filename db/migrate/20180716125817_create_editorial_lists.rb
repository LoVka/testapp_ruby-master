class CreateEditorialLists < ActiveRecord::Migration[5.2]
  def change
    create_table :editorial_lists do |t|
      t.string :title, null: false
      t.text :about
      t.string :slug, null: false

      t.timestamps
    end

    add_index :editorial_lists, :slug, unique: true

    create_table :editorial_lists_posts do |t|
      t.belongs_to :editorial_list, foreign_key: {to_table: :editorial_lists, on_delete: :cascade}, index: true, null: false
      t.belongs_to :post, foreign_key: {to_table: :posts, on_delete: :cascade}, index: true, null: false
    end
  end
end
