require 'dotenv'
require 'erubi'
require 'http'
require 'sinatra/base'

ENV_VARS = Dotenv.load(__dir__ + '/.env')

class Nasa < Sinatra::Base
  API_ENDPOINT = "https://api.nasa.gov/planetary/apod"
  get '/nasa' do
    random = HTTP.get(API_ENDPOINT, params: {
      api_key: ENV_VARS['NASA_API_KEY']
    })
    erb :nasa, locals: random.parse
  end
end
