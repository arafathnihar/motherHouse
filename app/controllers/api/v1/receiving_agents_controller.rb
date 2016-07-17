class Api::V1::ReceivingAgentsController < ApplicationController

  before_action except: [:index, :create]
  respond_to :json

  def index
    @receivingAgents = ReceivingAgent.where(status: 1)
    
    render json: @receivingAgents.as_json(include: :country), status: :ok
  end

  def create
    @receivingAgent = ReceivingAgent.new(data_params)
    @receivingAgent.main_agent_id = 1
    #@receivingAgent.customId = custom_id(ReceivingAgent, "RA", 5)
    @receivingAgent.guid = SecureRandom.uuid
    @receivingAgent.created_by = 1

    if @receivingAgent.save
      render json: @receivingAgent.as_json, status: :ok
    else
      render json: { errors: @receivingAgent.errors }, status: :unprocessable_entity
    end
  end

  def show
    @receivingAgent = ReceivingAgent.where(status: 1).find(params[:id])
    render json: @receivingAgent.as_json, status: :ok
  end

  def update
    if @receivingAgent.update_attributes(data_params.merge(updated_by: 1, updated_at: Time.now))
      render json: @receivingAgent.as_json, status: :ok
    else
      render json: { errors: @receivingAgent.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @receivingAgent = ReceivingAgent.find(params[:id])
    @receivingAgent.update_attributes(status:2, updated_by:1, updated_at:Time.now)
    render json: { message: "Success" }, status: :ok
  end

  def data_params
    params.fetch(:requestdata, {}).permit(:customId, :main_agent_id, :name, :contact, :country_id)
  end

end


