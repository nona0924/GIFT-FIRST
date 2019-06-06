class UnreadColumnAdd < ActiveRecord::Migration[5.0]
  def change
    
    add_column :unreads, :unread_user_id, :integer
  end
end
