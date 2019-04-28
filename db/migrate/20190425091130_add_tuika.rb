class AddTuika < ActiveRecord::Migration[5.0]
  def change
    
    add_column :lessons, :image, :string
    add_column :presents, :image, :string
  end
end
