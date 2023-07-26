class Dish < ApplicationRecord
  belongs_to :restaurants
  belongs_to :orders
end
