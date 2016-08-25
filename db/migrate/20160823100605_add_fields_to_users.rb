class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :staff_id, :integer
    add_column :users, :role, :string
  end
end
