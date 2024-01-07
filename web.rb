require 'sinatra'
require './api'

class Lemonade < Sinatra::Base
  use Api
  
  get '/' do
    "Success"
  end
end

Lemonade.start!
