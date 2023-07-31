class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :street
      t.string :postcode
      t.string :delivery_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
