require 'bundler'
require_relative 'models/giphy.rb'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post "/feel_better" do
    @feelings = params[:feelings].gsub(" ","+")
    @message = params[:message].gsub(" ","+")
    @api_response = format_request_and_send_api(@feelings, @message)
    erb :feel_better
  end
end

#See random stupid gif background slightly blurred
#Form with radio and text
#radio - 4 options stupid, dumb, idiotic, failure
#text - textarea with text above it - Put in your favorite tv show
#Submit button
#gsub out spaces with pluses
