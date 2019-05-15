class AddReplyUserIdToComment < ActiveRecord::Migration[5.0]
  def change
  
    add_column :boards, :reply_comment, :integer
  end
end
