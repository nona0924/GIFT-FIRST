class ChangeColumnMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :room_id, :integer
    add_column :messages, :message, :text
    remove_column :messages, :receiver, :integer
    remove_column :messages, :content, :text
  end
end
