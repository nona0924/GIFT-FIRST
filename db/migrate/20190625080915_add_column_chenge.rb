class AddColumnChenge < ActiveRecord::Migration[5.0]
  def change
    
    change_column :lessons, :lesson_date, :string
    change_column :users, :birdhday, :string
    
    add_column :boards, :image, :string
    
    remove_column :presents, :image, :string
    remove_column :lessons, :image, :string
  end
end
