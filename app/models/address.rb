class Address < ApplicationRecord
  belongs_to :user

  validates :country, :city, :street, :postcode, :region, :delivery_time, presence: true
end
