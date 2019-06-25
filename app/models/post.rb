class Post < ApplicationRecord
    mount_uploader :post_image, ImageUploader
    
    has_many :likes, :dependent => :destroy
    belongs_to :user
end
