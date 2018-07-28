class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :full_name
      t.string :address
      t.string :role
      t.string :aasm_state
      t.integer :age
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
