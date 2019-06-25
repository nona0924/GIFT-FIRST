class Board < ApplicationRecord
    
    mount_uploader :image, ImageUploader
    
    belongs_to :user
    has_many :lessons, :dependent => :destroy
    has_many :presents, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    has_many :replies, class_name: Comment, foreign_key: :reply_comment, dependent: :destroy
   
   
    
    #  def self.search(search)
    #   if search
    #     Board.where(['title LIKE ?', "%#{search}%"])
    #     # Board.where(['title ? OR address LIKE ? OR category LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    #   else
    #     Board.all
    #   end
    # end
    
 
    
end
