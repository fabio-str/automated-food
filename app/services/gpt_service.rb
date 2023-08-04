class GptService

  def self.prompt(nutrition_profile, address)
    "I'm in #{address.city} and would like to order some food for my lunch today at #{address.delivery_time} to #{address.street}.
    I like Asian and Indian cuisine.
    The meal should have about 900 calories and should be healthy.
    I have no dietary preferences or limitations."
  end

  def self.chat(nutrition_profile, address)
    @options = {
      headers: {
        "Authorization" => "Bearer #{ENV['OPENAPI_KEY']}",
        "Content-Type" => "application/json"
      },
      body: {
        model: "gpt-3.5-turbo", 
        messages: [
          { role: "system",    content: "You are a helpful assistant." },
          { role: "user", content: prompt(nutrition_profile, address) }
        ]
        }.to_json
    }

    response = HTTParty.post("https://api.openai.com/v1/chat/completions", @options)
    response.parsed_response
    puts response
  end

end
