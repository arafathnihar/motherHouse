class Api::V1::CountriesController < ApplicationController
  before_action :get_countries, except: [:index]
  respond_to :json

  def index
    @thispara = Country.all

    render json: @thispara.as_json, status: :ok
  end
end
