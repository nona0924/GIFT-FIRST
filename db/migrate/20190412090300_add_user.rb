class AddUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :icon, :string
  end
end
