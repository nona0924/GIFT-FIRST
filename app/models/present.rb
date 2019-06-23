class Present < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    has_many :present_images, :dependent => :destroy
    belongs_to :board
end
