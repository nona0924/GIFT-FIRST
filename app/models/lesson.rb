class Lesson < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    belongs_to :board
    has_many :lesson_image, :dependent => :destroy
end
