class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      
      t.integer :user_id
      t.string  :room_name

      t.timestamps
    end
  end
end
