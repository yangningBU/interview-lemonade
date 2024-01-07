require 'erubi'
require 'sinatra/base'

class Template < Sinatra::Base
  get '/template' do
    erb :template, locals: { hello: "world" }
  end
end
