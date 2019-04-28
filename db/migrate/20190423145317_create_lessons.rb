class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      
      t.integer :board_id
      t.string :title
      t.string :target_age
      t.date :lesson_date
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
