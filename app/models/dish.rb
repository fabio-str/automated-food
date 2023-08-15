class Dish < ApplicationRecord
  belongs_to :restaurant

  validates :name, presence: true
  validates :price, presence: true
  validates :url, presence: true
end
