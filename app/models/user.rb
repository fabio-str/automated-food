class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable

  scope :subscribed, -> { where(paying_customer: true) }

  has_many :addresses
  has_many :orders
  has_one :nutrition_profile, dependent: :destroy
  has_many :dishes, through: :orders
end
