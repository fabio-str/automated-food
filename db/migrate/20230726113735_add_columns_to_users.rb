class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sex, :string
    add_column :users, :age, :integer
    add_column :users, :height, :integer
    add_column :users, :weight, :float
    add_column :users, :activity_level, :string
    add_column :users, :health_goal, :string
  end
end
