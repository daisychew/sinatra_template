require "sinatra"
require "sinatra/reloader"
require "rest-client"
require "http"
require "json"

get '/' do
  erb(:input_form)
end

post '/submit' do
  user_input = params.fetch("user_input")

  api_url = "https://api.funtranslations.com/translate/yoda.json"

  response = RestClient.post(api_url, {text: user_input})

  @raw_response = response.body.to_s

  @parsed_response = JSON.parse(@raw_response)

  @contents_hash = @parsed_response.fetch("contents")

  @yoda = @contents_hash.fetch("translated")

  # render a view template where I show the symbols
  erb(:translation)
end
