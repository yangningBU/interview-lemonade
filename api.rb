require 'json'
require 'sinatra/base'

DATA_IN_MEMORY = {}

class Api < Sinatra::Base
  before %r{/api\/?.*} do
    content_type 'application/json'
  end

  get '/api' do
    { status: :ok }.to_json
  end

  post '/api/create_with_params' do
    key = params[:name]
    save_data(key, params[:data])
    print_data(key)
  end

  post '/api/create_with_json_body' do
    payload = JSON.parse request.body.read
    key = payload["name"]
    save_data(key, payload["data"])
    print_data(key)
  end

  private

  def save_data(key, value)
    logger.info "Adding #{value} to #{key}..."
    DATA_IN_MEMORY[key] = [] if DATA_IN_MEMORY[key].nil?
    DATA_IN_MEMORY[key] << value
  end

  def print_data(key)
    { key => DATA_IN_MEMORY[key] }.to_json
  end
end
