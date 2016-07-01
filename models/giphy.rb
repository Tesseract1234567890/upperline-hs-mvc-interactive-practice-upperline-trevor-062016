require 'uri'
require 'net/http'
require 'json'

def format_request_and_send_api(feelings, message)
  giphy_request = "http://api.giphy.com/v1/gifs/search?q="+feelings.gsub(" ","+")+message.gsub(" ","+")+"&api_key=dc6zaTOxFJmzC"
  make_api_call(giphy_request)
end

def make_api_call(request_string)
  uri = URI(request_string)
  response = Net::HTTP.get(uri)
  formatted_data = JSON.parse(response)
  data = formatted_data["data"]
  data.sample["embed_url"]
end
