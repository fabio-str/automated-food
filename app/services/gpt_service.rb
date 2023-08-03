require "httparty"
require 'json'

class GptService
  include HTTParty

  base_uri "https://api.openai.com/v1/chat/completions"

  def initialize
    @options = {
      headers: {
        "Authorization" => "Bearer #{ENV['OPENAPI_KEY']}",
        "Content-Type" => "application/json"
      },
      body: {
        model: "gpt-3.5-turbo", 
        messages: [
          { role: "system",    content: "You are a helpful assistant." },
          { role: "user", content: 'Hello' }
        ]
        }.to_json
    }
  end

  def chat
    response = self.class.post("https://api.openai.com/v1/chat/completions", @options)
    response.parsed_response
  end
end

ai = GptService.new
response = ai.chat
puts response
