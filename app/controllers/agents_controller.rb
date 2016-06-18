class AgentsController < ApplicationController
  before_action :get_agent, except: [:index, :create]
  respond_to :html, :json

  def index
    @thispara = Agent.all
    respond_with(@thispara) do |format|
      format.json { render :json => @thispara.as_json }
      format.html
    end
  end

  def create
    @thispara = Agent.new(this_params)

    @thispara.guid = SecureRandom.uuid
    @thispara.created_by = 1

    if @thispara.save
      render json: @thispara.as_json, status: :ok
    else
      render json: {user: @thispara.errors, status: :no_content}
    end
  end

  def show
    respond_with(@thispara.as_json)
  end

  def update
    if @thispara.update_attributes(this_params.merge(updated_by: 1, updated_at: Time.now))
      render json: @thispara.as_json, status: :ok
    else
      render json: {user: @thispara.errors, status: :unprocessable_entity}
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
    params.fetch(:requestdata, {}).permit(:customId, :mainAgentId, :name, :contact, :countryId)
  end
end
