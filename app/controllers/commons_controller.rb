class Api::CommonsController < ApplicationController

  respond_to :json

  def get_countries
    @countries = Country.all
    render json: @countries.as_json, status: :ok
  end

  def get_currencies
    @currencies = Currency.all
    render json: @currencies.as_json, status: :ok
  end

end
