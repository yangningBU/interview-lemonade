require 'sinatra/base'

class Phile < Sinatra::Base
  get '/file' do
    send_file './markdown.md',
      filename: "markdown.md",
      type: "text/markdown"
  end
end
