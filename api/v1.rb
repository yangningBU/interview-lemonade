require 'sinatra/base'
require 'sinatra/namespace'

class Api::V1 < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1' do
    get '/hello' do
      'world'
    end
  end
end
