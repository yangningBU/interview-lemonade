require 'dotenv'
require 'erubi'
require 'http'
require 'sinatra/base'

ENV_VARS = Dotenv.load(__dir__ + '/.env')

class Nasa < Sinatra::Base
  API_ENDPOINT = "https://api.nasa.gov/planetary/apod"
  
  get '/nasa' do
    picture_of_the_day = HTTP.get(API_ENDPOINT, params: {
      api_key: ENV_VARS['NASA_API_KEY']
    })
    erb :nasa, locals: picture_of_the_day.parse
  end
end
