class Api::V1::AgentaccountController < ApplicationSecureController

  before_action :get_agentaccount, except: [:index, :create, :nullify]
  respond_to :json

  def index
    @thispara = AgentAccount.where('date >= ?', params[:fromDate]).where('date <= ?', params[:toDate])

    render json: @thispara.as_json(include: [:mother_account, :agent]), status: :ok
  end

  def agent_index
    @agentFilter = AgentAccount.where(agent_id: params[:id]).where('date >= ?', params[:fromDate]).where('date <= ?', params[:toDate])

    render json: @agentFilter.as_json(include: [:mother_account, :agent]), status: :ok
  end

  def payments
    @agentPayments = AgentAccount.where({id: params[:id], isPaid: true})

    render json: @agentPayments.as_json(include: [:mother_account, :agent]), status: :ok
  end

  def create
    if (AccountService.new().create_agent_ac(this_params, true))
      render json: { message: "Success" }, status: :ok
    else
      render json: { message: "Failed" }, status: :unprocessable_entity
    end
  end

  def update
    # if @thispara.update_attributes(this_params.merge(updated_by: 1, updated_at: Time.now))
      if (AccountService.new().nullify_agent_ac(params[:id]))
        if (AccountService.new().create_agent_ac(this_params, true))
          render json: { message: "Success" }, status: :ok
        else
          # rollback
          render json: { message: "Failed" }, status: :unprocessable_entity
        end
      else
        # rollback
        render json: { message: "Failed" }, status: :unprocessable_entity
      end
    # else
    #   render json: { errors: @thispara.errors }, status: :unprocessable_entity
    # end
  end

  def nullify
    if ( AccountService.new().nullify_agent_ac(params[:id]) )
      render json: { message: "Success" }, status: :ok
    else
      render json: { message: "Failed" }, status: :unprocessable_entity
    end
  end

  # put into common controller
  def rollback(model, record_id)
    @thispara = model.find(record_id)
    @thispara.destroy
  end

  private

  def get_agentaccount
    @thispara = AgentAccount.find(params[:id])
    render json: {status: :not_found} unless @thispara
  end

  def this_params
    params.fetch(:requestdata, {}).permit(:agent_id, :amount, :date, :collector_name)
  end
end
