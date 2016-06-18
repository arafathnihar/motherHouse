class CommonsController < ApplicationController

  respond_to :json

  def get_countries
    @country = Country.all
    respond_with(@countries) do |format|
      format.json { render :json => @country.as_json }
      format.html
    end
  end

  def get_currencies
    @currency = Currency.all
    respond_with(@currencies) do |format|
      format.json { render :json => @currency.as_json }
      format.html
    end
  end

end
