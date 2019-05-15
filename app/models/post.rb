class Post < ApplicationRecord
    mount_uploader :post_image, ImageUploader
    
    has_many :likes
    belongs_to :user
    has_many :comments
end
