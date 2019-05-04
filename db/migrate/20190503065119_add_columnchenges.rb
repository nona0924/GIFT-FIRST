class AddColumnchenges < ActiveRecord::Migration[5.0]
  def change
    
    add_column :boards, :category, :string
  end
end
