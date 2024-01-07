require 'json'

require_relative './api'
require_relative '../spec_helper'

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

  describe 'POST /api/create_with_params' do

    subject(:response) do
      post '/api/create_with_params?name=field&data=45'
    end

    it "returns created data object" do
      body = JSON.parse(response.body)
      expect(body).to eq({"field" => ["45"]})
    end

    context "multiple POSTs" do
      it "saves previous calls" do
        subject

        body = JSON.parse(response.body)
        expect(body).to eq({"field" => ["45", "45"]})
      end
    end
  end

  describe 'POST /api/create_with_json_body' do
    subject(:response) do
      post(
        '/api/create_with_json_body',
        { name: "field", data: 45 }.to_json
      )
    end

    it "returns created data object" do
      body = JSON.parse(response.body)
      expect(body).to eq({"field" => ["45", "45", 45]})
    end
  end
end
