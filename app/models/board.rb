class Board < ApplicationRecord
    
    belongs_to :user
    has_many :lessons
    has_many :presents
    has_many :comments
end
