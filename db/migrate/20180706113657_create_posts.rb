class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.belongs_to :category, foreign_key: {to_table: :categories, on_delete: :cascade}, index: true, null: false
      t.belongs_to :user, foreign_key: {to_table: :users, on_delete: :nullify}, index: true
      t.string :title, null: false
      t.text :body, null: false
      t.text :lead, null: false

      t.timestamps
    end
  end
end
