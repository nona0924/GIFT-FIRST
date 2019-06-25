class Present < ApplicationRecord
   
    
    has_many :present_images, :dependent => :destroy
    belongs_to :board
end
