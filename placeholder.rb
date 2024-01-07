require 'http'
require 'sinatra/base'

class Placeholder < Sinatra::Base
  get '/placeholder' do
    content_type 'application/json'
    response = HTTP.post(
      "https://jsonplaceholder.typicode.com/posts",
      :form => { title: 'foo', body: 'bar', userID: 1}
    )
    response.parse.to_s
  end
end
