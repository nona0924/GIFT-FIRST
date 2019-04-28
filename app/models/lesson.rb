class Lesson < ApplicationRecord
    
    belongs_to :board
    has_many :lesson_image
end
