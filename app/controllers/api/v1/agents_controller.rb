class Api::V1::AgentsController < ApplicationController

  before_action except: [:index, :create]
  respond_to :html, :json

  def index
    @thispara = Agent.where(status: 1)

    render json: @thispara.as_json(include: :country), status: :ok
  end

  def create
    @thispara = Agent.new(this_params)
    @thispara.main_agent_id = 1
    @thispara.guid = SecureRandom.uuid
    @thispara.created_by = 1

    if @thispara.save
      render json: @thispara.as_json, status: :ok
    else
      render json: { errors: @thispara.errors }, status: :unprocessable_entity
    end
  end

  def show
    @thispara = Agent.where(status: 1).find(params[:id])
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
    @thispara = Agent.find(params[:id])
    @thispara.update_attributes(status:2, updated_by:1, updated_at:Time.now)
    render json: { message: "Success" }, status: :ok
  end

  def this_params
    params.fetch(:requestdata, {}).permit(:customId, :main_agent_id, :name, :contact, :country_id)
  end
end
