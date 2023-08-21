class GptService

  def self.prompt(dish)
    "Estimate the approximate total calories for #{dish.name} with the following ingredients: #{dish.ingredients}. 
    I only need a rough estimation, not a precise value (if your approximation is a range, take the average of the two values). 
    If you don’t have any approximation for an ingredient, don’t include it in your estimate.
    Please make sure that the format of your response is like this: 'Total Calories: {your result}'. This is important.
    Limit your answer to just the result."
  end

  def self.chat(dish)
    @options = {
      headers: {
        "Authorization" => "Bearer #{ENV['OPENAPI_KEY']}",
        "Content-Type" => "application/json"
      },
      body: {
        model: "gpt-3.5-turbo", 
        messages: [
          { role: "system",    content: "You are a nutritionist who can help with dietary needs by providing recipes, advice on healthy eating habits, and dietary recommendations." },
          { role: "user", content: prompt(dish) }
        ]
        }.to_json
    }

    response = HTTParty.post("https://api.openai.com/v1/chat/completions", @options)
    response.parsed_response
  end

end
