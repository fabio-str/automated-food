class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_rating
      t.string :user_feedback
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
