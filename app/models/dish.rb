class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :order

  validates :name, presence: true
  validates :price, presence: true
  validates :ingredients, presence: true
  validates :url, presence: true
end
