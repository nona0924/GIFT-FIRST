class Present < ApplicationRecord
    
    has_many :present_images
    belongs_to :board
end
