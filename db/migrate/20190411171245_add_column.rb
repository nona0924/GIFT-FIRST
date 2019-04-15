class AddColumn < ActiveRecord::Migration[5.0]
  def change
    change_column_default :rooms, :room_name, "新規チャット" 
    
  end
end
