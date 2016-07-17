class Api::V1::MotheraccountController < ApplicationController

  before_action :get_motheraccount, except: [:index, :nullify]
  respond_to :json

  def index
    @thispara = MotherAccount.all

    render json: @thispara.as_json(include: [:main_agent, :agent]), status: :ok
  end

  # put into common controller
  def rollback(model, record_id)
    @thispara = model.find(record_id)
    @thispara.destroy
  end

  private

  def get_motheraccount
    @thispara = MotherAccount.find(params[:id])
    render json: {status: :not_found} unless @thispara
  end

end
