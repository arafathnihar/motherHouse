class ReceivingAgentsController < ApplicationController

  before_action :get_receiving_agent, except: [:index, :create]
  respond_to :json

  def index
    @receivingAgent = ReceivingAgent.all
    respond_with(@receivingAgents) do |format|
      format.json { render :json => @receivingAgent.as_json }
      format.html
    end
  end

  def create
    @receivingAgent = ReceivingAgent.new(data_params)
    @receivingAgent.guid = SecureRandom.uuid
    @receivingAgent.created_by = 1
    if @receivingAgent.save
      render json: @receivingAgent.as_json, status: :ok
    else
      render json: {receivingAgent: @receivingAgent.errors, status: :no_content}
    end
  end

  def show
    respond_with(@receivingAgent.as_json)
  end

  def update
    if @receivingAgent.update_attributes(data_params)
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
    params.fetch(:dataparams, {}).permit(:customId, :mainAgentId, :name, :contact, :countryId)
  end

  def get_receiving_agent
    @receivingAgent = ReceivingAgent.find(params[:id])
    render json: {status: :not_found} unless @receivingAgent
  end

end


