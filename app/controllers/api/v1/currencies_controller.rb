class Api::V1::CurrenciesController < ApplicationController
  before_action :get_currencies, except: [:index]
  respond_to :json

  def index
    @thispara = Currency.all

    render json: @thispara.as_json, status: :ok
  end
end
