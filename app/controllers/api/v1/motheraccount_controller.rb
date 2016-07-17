class Api::V1::MotheraccountController < ApplicationController

  before_action except: [:index, :nullify]
  respond_to :json

  def index
    @thispara = MotherAccount.where(status: 1)

    render json: @thispara.as_json(include: [:main_agent, :agent]), status: :ok
  end

end
