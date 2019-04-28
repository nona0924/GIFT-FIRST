class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      
       t.integer :user_id
       t.integer :evaluated_user_id
       t.string :message
       t.integer :point

      t.timestamps
    end
  end
end
