class Api::V1::MotherhouseController < ApplicationController

  before_action :get_motherhouse, except: [:index, :create]
  respond_to :json

  def index
    @thispara = MainAgent.where(status: 1)

    render json: @thispara.as_json(include: :country), status: :ok
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
    @thispara = MainAgent.where(status: 1).find(params[:id])
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
    @thispara.update_attributes(status:2, updated_by:1, updated_at:Time.now)
    render json: { message: "Success" }, status: :ok
  end

  def get_motherhouse
    @thispara = MainAgent.find(params[:id])
    render json: {status: :not_found} unless @thispara
  end

  def this_params
    params.fetch(:requestdata, {}).permit(:customId, :name, :contact, :country_id)
  end
end
