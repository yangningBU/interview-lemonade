require 'sinatra'
require './api/api'
require './api/v1'
require './named_params'
require './nasa'
require './phile'
require './placeholder'
require './template'

class Lemonade < Sinatra::Base
  use Api
  use Api::V1
  use NamedParams
  use Nasa
  use Phile
  use Placeholder
  use Template
  
  get '/' do
    "Success"
  end
end

Lemonade.start!
