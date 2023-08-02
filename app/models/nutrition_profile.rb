class NutritionProfile < ApplicationRecord
  belongs_to :user

  validates :sex, :age, :height, :weight, :activity_level, :health_goal, presence: true
end
