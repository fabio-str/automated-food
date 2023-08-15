class Dish < ApplicationRecord
  belongs_to :restaurant

  validates :name, presence: true
  validates :price, presence: true
  validates :url, presence: true

  def estimate_calories
    response = GptService.chat(self)
    estimated_calories = extract_calories(response)
    self.update(total_calories: estimated_calories)
  end
  
  def extract_calories(response)
    response['choices'][0]['message']['content'].gsub('Total Calories: ', '').strip
  end
  
end
