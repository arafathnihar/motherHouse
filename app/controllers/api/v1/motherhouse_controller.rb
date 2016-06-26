class Api::V1::MotherhouseController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "secret"
  # before_action :get_motherhouse, except: [:index, :create]
  respond_to :json

  # before_action :get_motherhouse, except: [:index, :create]
  # respond_to :html, :json

  def index
    @thispara = MainAgent.all
    render json: @thispara.as_json, status: :ok
  end

  def create
    @thispara = MainAgent.new(this_params)

    #@thispara.customId = custom_id(MainAgent, "MH", 8)
    @thispara.guid = SecureRandom.uuid
    @thispara.created_by = 1

    if @thispara.save
      render json: @thispara.as_json, status: :ok
    else
      render json: { errors: @thispara.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @thispara.as_json, status: :ok
  end

  def update
    if @thispara.update_attributes(this_params.merge(updated_by: 1, updated_at: Time.now))
      render json: @thispara.as_json, status: :ok
    else
      render json: { errors: @thispara.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @thispara = MainAgent.find(params[:id])
    @thispara.destroy
    render json: {status: :ok}
  end

  private

  def get_motherhouse
    @thispara = MainAgent.find(params[:id])
    render json: {status: :not_found} unless @thispara
  end

  def this_params
    params.fetch(:requestdata, {}).permit(:name, :contact, :countryId)
  end
end
