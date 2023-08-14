class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :rating, presence: true
  validates :url, presence: true, uniqueness: true
  # TODO: Add validation for opening and closing times based on your requirements.

  end