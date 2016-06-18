class MotherhouseController < ApplicationController
  before_action :get_motherhouse, except: [:index, :create]
  respond_to :html, :json

  def index
    @thispara = MainAgent.all
    respond_with(@thispara) do |format|
      format.json { render :json => @thispara.as_json }
      format.html
    end
  end

  def create
    @thispara = MainAgent.new(this_params)

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
    if @thispara.update_attributes(this_params)
      render json: @thispara.as_json, status: :ok
    else
      render json: {user: @thispara.errors, status: :unprocessable_entity}
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
    params.fetch(:requestdata, {}).permit(:customId, :name, :contact, :countryId)
  end
end
