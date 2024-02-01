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

  api_hash = response.body

  contents_hash = api_hash.fetch("contents")

  @yoda = parsed_data.fetch("translated")

  # render a view template where I show the symbols
  erb(:translation)
end
