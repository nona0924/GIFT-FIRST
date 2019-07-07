class Lesson < ApplicationRecord
    
    
    belongs_to :board
    has_many :lesson_image, :dependent => :destroy
    
    validates :title, presence: true
    validates :target_age, presence: true
    
    # validates :date_cannot_be_in_the_past
    # validates :start_end_check
    

     def date_cannot_be_in_the_past
         if lesson_date.present?
    #   if lesson_date.present? && lesson_date < Date.today
    #     errors.add(:lesson_date, ": 過去の日付は使用できません")
    #   end
   end
  end
  
    
    def start_end_check
    errors.add(:end_time, "の日付を正しく記入して下さい。") unless
    self.start_time.delete(":").to_s < self.end_time.delete(":").to_s
    
  end 
  
end
