class AddReplyUserIdToCo < ActiveRecord::Migration[5.0]
  def change
    
    add_column :comments, :reply_comment, :integer
    remove_column :boards, :reply_comment, :integer
  end
end
