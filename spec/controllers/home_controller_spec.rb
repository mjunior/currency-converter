
require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response.status).to eql(200)
    end
  end

  describe "POST #exchange" do
    before do
      currency_list = JSON.parse(File.read("./spec/fixtures/currency_list.json"))['currency_list']
      @currency, @currency_destination = currency_list.sample(2)
      @quantity = rand(1..9999)
    end

    it "Returns http success" do
      post :exchange, params: {currency: @currency, currency_destination: @currency_destination, quantity: @quantity}
      expect(response).to have_http_status(:success)
    end

    it "Returns a numeric value" do
      post :exchange, params: {currency: @currency, currency_destination: @currency_destination, quantity: @quantity}
      result = JSON.parse(response.body)['value']
      expect(result.is_a? Numeric).to eql(true)
    end
  end
end