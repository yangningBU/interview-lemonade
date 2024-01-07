require 'sinatra'
require './api'
require './phile'

class Lemonade < Sinatra::Base
  use Api
  use Phile
  
  get '/' do
    "Success"
  end
end

Lemonade.start!
