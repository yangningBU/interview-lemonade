require 'json'

require './api'
require './spec_helper'

describe Api do
  def app
    Api
  end

  describe 'GET /api' do

    subject(:response) { get '/api' }

    it "returns an okay status" do
      body = JSON.parse(response.body)
      expect(body).to eq({ "status" => "ok" })
    end

    it "returns JSON Content-Type" do
      header = response.headers["Content-Type"]
      expect(header).to eq("application/json")
    end
  end
end
