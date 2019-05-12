class Board < ApplicationRecord
    
    belongs_to :user
    has_many :lessons
    has_many :presents
    has_many :comments
    
    #  def self.search(search)
    #   if search
    #     Board.where(['title LIKE ?', "%#{search}%"])
    #     # Board.where(['title ? OR address LIKE ? OR category LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    #   else
    #     Board.all
    #   end
    # end
    
 
    
end
