class CreateUnreads < ActiveRecord::Migration[5.0]
  def change
    create_table :unreads do |t|
      
       t.integer :message_id
       t.integer :user_id

      t.timestamps
    end
  end
end
