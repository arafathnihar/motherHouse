class ReceivingAgentsController < ApplicationController

  before_action :get_receiving_agent, except: [:index, :create]
  respond_to :json

  def index
    @receivingAgents = ReceivingAgent.all
    render json: @receivingAgents.as_json, status: :ok
  end

  def create
    @receivingAgent = ReceivingAgent.new(data_params)

    @receivingAgent.customId = custom_id(ReceivingAgent, "RA", 5)
    @receivingAgent.guid = SecureRandom.uuid
    @receivingAgent.created_by = 1

    if @receivingAgent.save
      render json: @receivingAgent.as_json, status: :ok
    else
      render json: {receivingAgent: @receivingAgent.errors, status: :no_content}
    end
  end

  def show
    render json: @receivingAgent.as_json, status: :ok
  end

  def update
    if @receivingAgent.update_attributes(data_params.merge(updated_by: 1, updated_at: Time.now))
      render json: @receivingAgent.as_json, status: :ok
    else
      render json: {receivingAgent: @receivingAgent.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    @receivingAgent = ReceivingAgent.find(params[:id])
    @receivingAgent.destroy
    render json: {status: :ok}
  end

  private

  def data_params
    params.fetch(:requestdata, {}).permit(:customId, :mainAgentId, :name, :contact, :countryId)
  end

  def get_receiving_agent
    @receivingAgent = ReceivingAgent.find(params[:id])
    render json: {status: :not_found} unless @receivingAgent
  end

end


