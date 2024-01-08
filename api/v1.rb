require 'json'
require 'sinatra/base'
require 'sinatra/namespace'

class Api::V1 < Sinatra::Base
  register Sinatra::Namespace

  before do
    content_type 'application/json'
  end

  namespace '/api/v1' do
    get '/hello' do
      { "hello" => "world" }.to_json
    end
  end
end
