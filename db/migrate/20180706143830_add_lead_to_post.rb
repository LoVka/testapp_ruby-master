class AddLeadToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :lead, :text
  end
end
