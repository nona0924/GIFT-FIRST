class LessonDateChenge < ActiveRecord::Migration[5.0]
  def change
    
    change_column :lessons, :lesson_date, :date
  end
end
