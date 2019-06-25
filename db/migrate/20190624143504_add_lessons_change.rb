class AddLessonsChange < ActiveRecord::Migration[5.0]
  def change
    
    change_column :lessons, :start_time, :string
    change_column :lessons, :end_time, :string
    
  end
end
