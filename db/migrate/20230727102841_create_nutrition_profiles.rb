class CreateNutritionProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :nutrition_profiles do |t|
      t.string :sex
      t.integer :age
      t.integer :height
      t.float :weight
      t.string :activity_level
      t.string :health_goal
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
