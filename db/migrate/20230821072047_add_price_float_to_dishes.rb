class AddPriceFloatToDishes < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :price_float, :float
  end
end
