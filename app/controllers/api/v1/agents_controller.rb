class Api::V1::AgentsController < ApplicationController

  before_action :get_agent, except: [:index, :create]
  respond_to :html, :json

  def index
    @thispara = Agent.all
    render json: @thispara.as_json, status: :ok
  end

  def create
    @thispara = Agent.new(this_params)

    @thispara.customId = custom_id(Agent, "AG", 5)
    @thispara.guid = SecureRandom.uuid
    @thispara.created_by = 1

    if @thispara.save
      render json: @thispara.as_json, status: :ok
    else
      render json: {errors: @thispara.errors, status: :unprocessable_entity}
    end
  end

  def show
    render json: @thispara.as_json, status: :ok
  end

  def update
    if @thispara.update_attributes(this_params.merge(updated_by: 1, updated_at: Time.now))
      render json: @thispara.as_json, status: :ok
    else
      render json: {errors: @thispara.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    @thispara = Agent.find(params[:id])
    @thispara.destroy
    render json: {status: :ok}
  end

  private

  def get_agent
    @thispara = Agent.find(params[:id])
    render json: {status: :not_found} unless @thispara
  end

  def this_params
    params.fetch(:requestdata, {}).permit(:mainAgentId, :name, :contact, :countryId)
  end
end
