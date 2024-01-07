require 'sinatra/base'

class NamedParams < Sinatra::Base
  get '/hello/:name' do
    "Hello there, #{params[:name]}"
  end
end
