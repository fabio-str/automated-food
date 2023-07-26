class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :price
      t.string :ingredients
      t.string :url
      t.references :restaurants, null: false, foreign_key: true

      t.timestamps
    end
  end
end
