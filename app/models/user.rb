class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable

  scope :subscribed, -> { where(paying_customer: true) }

  has_one :addresses
  has_many :orders
  has_one :nutrition_profiles
  has_many :dishes, through: :projects
end
