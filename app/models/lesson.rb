class Lesson < ApplicationRecord
    
    
    belongs_to :board
    has_many :lesson_image, :dependent => :destroy
end
