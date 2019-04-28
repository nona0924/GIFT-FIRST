class CreatePresents < ActiveRecord::Migration[5.0]
  def change
    create_table :presents do |t|
      
      t.integer :board_id
      t.string :status
      t.string :gift_name

      t.timestamps
    end
  end
end
