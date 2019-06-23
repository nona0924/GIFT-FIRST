class Post < ApplicationRecord
    mount_uploader :post_image, ImageUploader
    
    has_many :likes, :dependent => :destroy
    belongs_to :user
    has_many :comments, :dependent => :destroy
end
