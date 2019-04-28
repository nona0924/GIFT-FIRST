class Post < ApplicationRecord
    mount_uploader :post_image, ImageUploader
    
    has_many :likes
    belongs_to :user
end
