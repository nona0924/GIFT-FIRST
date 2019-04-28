class CreatePresentImages < ActiveRecord::Migration[5.0]
  def change
    create_table :present_images do |t|
      
      t.integer :present_id
      t.string :present_image

      t.timestamps
    end
  end
end
