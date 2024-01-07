require 'sinatra'
require './api'
require './phile'
require './template'

class Lemonade < Sinatra::Base
  use Api
  use Phile
  use Template
  
  get '/' do
    "Success"
  end
end

Lemonade.start!
