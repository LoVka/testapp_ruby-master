class CreateEditorialLists < ActiveRecord::Migration[5.2]
  def change
    create_table :editorial_lists do |t|
      t.string :title
      t.text :about
      t.string :slug

      t.timestamps
    end

    create_table :editorial_lists_posts do |t|
      t.belongs_to :editorial_list, index: true
      t.belongs_to :post, index: true
    end
  end
end
