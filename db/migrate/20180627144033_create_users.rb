class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :full_name, null: false
      t.string :address, null: false
      t.string :role, null: false
      t.string :aasm_state, null: false
      t.integer :age, null: false
      t.boolean :admin, default: false, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
