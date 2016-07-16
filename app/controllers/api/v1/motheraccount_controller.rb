class Api::V1::MotheraccountController < ApplicationController

  before_action :get_motheraccount, except: [:index, :nullify]
  respond_to :json

  def index
    @thispara = MotherAccount.all

    render json: @thispara.as_json(include: [:main_agent, :agent]), status: :ok
  end

  # def create
  #   @thispara = MotherAccount.new(this_params)
  #
  #   @thispara.guid = SecureRandom.uuid
  #   @thispara.created_by = 1
  #
  #   if @thispara.save
  #     render json: @thispara.as_json, status: :ok
  #   else
  #     render json: { errors: @thispara.errors }, status: :unprocessable_entity
  #   end
  # end

  # def show
  #   render json: @thispara.as_json, status: :ok
  # end

  # def update
  #   if @thispara.update_attributes(this_params.merge(updated_by: 1, updated_at: Time.now))
  #     render json: @thispara.as_json, status: :ok
  #   else
  #     render json: { errors: @thispara.errors }, status: :unprocessable_entity
  #   end
  # end

  # def nullify
  #   @motherToDelete = MotherAccount.find(params[:id])
  #   @agentToDelete = AgentAccount.find_by_mother_ac_id(@motherToDelete.id)
  #
  #   if (@motherToDelete.isNullified == true || @agentToDelete.isNullified == true || @agentToDelete.crAmount != @motherToDelete.drAmount || @agentToDelete.drAmount != @motherToDelete.crAmount)
  #     render json: { message: "Fails" }, status: :unprocessable_entity
  #     return
  #   end
  #
  #   # for cumulation value
  #   @lastMotherAc = MotherAccount.order(:id).last()
  #   @lastAgentAc = AgentAccount.where(agent_id: @motherToDelete.agent_id).order(:id).last()
  #
  #   mother_account_params = {
  #       main_agent_id:1, agent_id:@motherToDelete.agent_id, drAmount:@motherToDelete.crAmount != nil ? @motherToDelete.crAmount : nil, crAmount:@motherToDelete.drAmount != nil ? @motherToDelete.drAmount : nil,
  #       cumulation:@motherToDelete.drAmount != nil ? @lastMotherAc.cumulation-@motherToDelete.drAmount : @lastMotherAc.cumulation+@motherToDelete.crAmount,
  #       date:DateTime.now, nullify_id:@motherToDelete.id, isNullified:true, guid:SecureRandom.uuid, created_by:1
  #   }
  #   @mother = MotherAccount.new(mother_account_params)
  #
  #   if (@mother.save)
  #     if (@motherToDelete.update_attributes(isNullified:true, nullify_id: @mother.id, updated_by: 1, updated_at: Time.now))
  #       agent_account_params = {
  #           agent_id:@motherToDelete.agent_id, mother_ac_id:@mother.id, drAmount:@agentToDelete.crAmount != nil ? @agentToDelete.crAmount : nil, crAmount:@agentToDelete.drAmount != nil ? @agentToDelete.drAmount : nil,
  #           cumulation:@agentToDelete.crAmount != nil ? @lastAgentAc.cumulation-@agentToDelete.crAmount : @lastAgentAc.cumulation+@agentToDelete.drAmount,
  #           date:DateTime.now, nullify_id:@agentToDelete.id, isNullified:true, guid:SecureRandom.uuid, created_by:1
  #       }
  #       @agent = AgentAccount.new(agent_account_params)
  #
  #       if (@agent.save)
  #         if (@agentToDelete.update_attributes(isNullified:true, nullify_id:@agent.id, updated_by:1, updated_at:Time.now))
  #           render json: { message: "Success" }, status: :ok
  #         else
  #           rollback(MotherAccount, @mother.id)
  #           @motherToDelete.update_attributes(isNullified:false, nullify_id:nil, updated_by:nil, updated_at:nil)
  #           rollback(AgentAccount, @agent.id)
  #
  #           render json: { message: @mother.errors }, status: :unprocessable_entity
  #         end
  #       else
  #         rollback(MotherAccount, @mother.id)
  #         @motherToDelete.update_attributes(isNullified:false, nullify_id:nil, updated_by:nil, updated_at:nil)
  #
  #         render json: { message: @mother.errors }, status: :unprocessable_entity
  #       end
  #     else
  #       rollback(MotherAccount, @mother.id)
  #       render json: { message: @mother.errors }, status: :unprocessable_entity
  #     end
  #   else
  #     render json: { message: @mother.errors }, status: :unprocessable_entity
  #   end
  # end

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

  # def this_params
  #   params.fetch(:requestdata, {}).permit(:main_agent_id, :name, :contact, :country_id)
  # end
end
