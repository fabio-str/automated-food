class NutritionProfile < ApplicationRecord
  belongs_to :user

  ACTIVITY_LEVEL_MULTIPLIERS = {
    'Sedentary' => 1.2,
    'Moderately active' => 1.55,
    'Vigorously active' => 1.725,
    'Extremely active' => 1.9
  }.freeze
  
  SEX_BMR_FACTORS = {
    "Male" => { mul_weight: 13.75, mul_height: 5.003, factor: 66.5, mul_age: 6.75 },
    "Female" => { mul_weight: 9.563, mul_height: 1.850, factor: 655.1, mul_age: 4.676 }
  }.freeze
  
  validates :sex, :age, :height, :weight, :activity_level, :health_goal, presence: true
  before_save :set_daily_calorie_need

  def save_or_update
    current_user.nutrition_profile.nil? ? save : update
  end

  def calculate_daily_calorie_need
    (ACTIVITY_LEVEL_MULTIPLIERS.fetch(activity_level, "You have to fill out your nutrition profile first.") * calculate_bmr).to_i
  end

  def calculate_bmr 
    factors = SEX_BMR_FACTORS[sex]
    factors[:factor] + (factors[:mul_weight] * weight) + (factors[:mul_height] * height) - (factors[:mul_age] * age)
  end

  private

  def set_daily_calorie_need
    self.daily_calorie_need = calculate_daily_calorie_need
  end

end
