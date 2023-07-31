class AddRegionToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :region, :string
  end
end
