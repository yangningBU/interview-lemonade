require 'sinatra'
require './api'
require './nasa'
require './phile'
require './placeholder'
require './template'

class Lemonade < Sinatra::Base
  use Api
  use Nasa
  use Phile
  use Placeholder
  use Template
  
  get '/' do
    "Success"
  end
end

Lemonade.start!
