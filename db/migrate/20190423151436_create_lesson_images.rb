class CreateLessonImages < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_images do |t|
      
      t.integer :lesson_id
      t.string :lesson_image

      t.timestamps
    end
  end
end
