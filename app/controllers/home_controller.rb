class HomeController < ApplicationController
  def index
  end

  def exchange
    value = Currency.exchange params[:currency], params[:currency_destination], params[:quantity].to_f
    render json: {value: value}, status: :ok
  end
end
