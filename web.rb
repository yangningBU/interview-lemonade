require 'sinatra'
require './api'
require './nasa'
require './phile'
require './template'

class Lemonade < Sinatra::Base
  use Api
  use Nasa
  use Phile
  use Template
  
  get '/' do
    "Success"
  end
end

Lemonade.start!
