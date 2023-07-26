class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :monday_open
      t.string :monday_close
      t.string :tuesday_open
      t.string :tuesday_close
      t.string :wednesday_open
      t.string :wednesday_close
      t.string :thursday_open
      t.string :thursday_close
      t.string :friday_open
      t.string :friday_close
      t.string :saturday_open
      t.string :saturday_close
      t.string :sunday_open
      t.string :sunday_close
      t.string :rating
      t.string :url

      t.timestamps
    end
  end
end
