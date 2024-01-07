require 'json'
require 'sinatra'

before %r{/api\/?.*} do
  content_type 'application/json'
end

get '/api' do
  { status: :ok }.to_json
end
