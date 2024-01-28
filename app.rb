require "sinatra"
require "sinatra/reloader"
require "rest-client"
require "http"
require "json"

get '/input_form' do
  erb :input_form
end

post '/submit' do
  user_input = params['user_input']

  api_url = "https://api.funtranslations.com/translate/yoda.json"
  response = RestClient.post(api_url, {text: user_input})

  "API Response: #{response.body}"
end
# get("/") do
#   # build the API url, including the API key in the query string
#   api_url = "https://api.funtranslations.com/translate/yoda.json"

#   # use HTTP.get to retrieve the API information
#   raw_data = HTTP.get(api_url)

#   # convert the raw request to a string
#   raw_data_string = raw_data.to_s

#   # convert the string to JSON
#   parsed_data = JSON.parse(raw_data_string)

#   # get the symbols from the JSON
#   translator_hash = parsed_data.fetch("contents")

#   # get the translation from the hash
#   yoda = translator_hash.fetch("translated")

#   # render a view template where I show the symbols
#   erb(:homepage)
# end
