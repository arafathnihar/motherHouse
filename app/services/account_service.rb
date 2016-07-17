class AccountService

  def nullify_mother_ac(id_order)
    @motherToDelete = MotherAccount.find_by_order_id(id_order)
    @agentToDelete = AgentAccount.find_by_mother_ac_id(@motherToDelete.id)

    if (@motherToDelete.isNullified == true || @agentToDelete.isNullified == true || @agentToDelete.crAmount != @motherToDelete.drAmount || @agentToDelete.drAmount != @motherToDelete.crAmount)
      # render json: { message: "Fails" }, status: :unprocessable_entity
      return false
    end

    # for cumulation value
    @lastMotherAc = MotherAccount.order(:id).last()
    @lastAgentAc = AgentAccount.where(agent_id: @motherToDelete.agent_id).order(:id).last()
    @lastMostAgentAc = AgentAccount.order(:id).last()

    mother_account_params = {
        main_agent_id:1, agent_id:@motherToDelete.agent_id, drAmount:@motherToDelete.crAmount != nil ? @motherToDelete.crAmount : nil, crAmount:@motherToDelete.drAmount != nil ? @motherToDelete.drAmount : nil,
        cumulation:@motherToDelete.drAmount != nil ? @lastMotherAc.cumulation-@motherToDelete.drAmount : @lastMotherAc.cumulation+@motherToDelete.crAmount,
        date:DateTime.now, nullify_id:@motherToDelete.id, isNullified:true, guid:SecureRandom.uuid, created_by:1
    }
    @mother = MotherAccount.new(mother_account_params)

    if (@mother.save)
      if (@motherToDelete.update_attributes(isNullified:true, nullify_id: @mother.id, updated_by: 1, updated_at: Time.now))
        agent_account_params = {
            agent_id:@motherToDelete.agent_id, mother_ac_id:@mother.id, drAmount:@agentToDelete.crAmount != nil ? @agentToDelete.crAmount : nil, crAmount:@agentToDelete.drAmount != nil ? @agentToDelete.drAmount : nil,
            agent_cumulation:@agentToDelete.crAmount != nil ? @lastAgentAc.agent_cumulation-@agentToDelete.crAmount : @lastAgentAc.agent_cumulation+@agentToDelete.drAmount,
            cumulation:@agentToDelete.crAmount != nil ? @lastMostAgentAc.cumulation-@agentToDelete.crAmount : @lastMostAgentAc.cumulation+@agentToDelete.drAmount,
            date:DateTime.now, nullify_id:@agentToDelete.id, isNullified:true, guid:SecureRandom.uuid, created_by:1
        }
        @agent = AgentAccount.new(agent_account_params)

        if (@agent.save)
          if (@agentToDelete.update_attributes(isNullified:true, nullify_id:@agent.id, updated_by:1, updated_at:Time.now))
            # render json: { message: "Success" }, status: :ok
            return true
          else
            rollback(MotherAccount, @mother.id)
            @motherToDelete.update_attributes(isNullified:false, nullify_id:nil, updated_by:nil, updated_at:nil)
            rollback(AgentAccount, @agent.id)

            # render json: { message: @mother.errors }, status: :unprocessable_entity
            return false
          end
        else
          rollback(MotherAccount, @mother.id)
          @motherToDelete.update_attributes(isNullified:false, nullify_id:nil, updated_by:nil, updated_at:nil)

          # render json: { message: @mother.errors }, status: :unprocessable_entity
          return false
        end
      else
        rollback(MotherAccount, @mother.id)
        # render json: { message: @mother.errors }, status: :unprocessable_entity
        return false
      end
    else
      # render json: { message: @mother.errors }, status: :unprocessable_entity
      return false
    end
  end

  def create_mother_ac(id_agent, id_order, var_order_amount, var_exchange_rate)
    @lastMotherAc = MotherAccount.order(:id).last()
    @lastAgentAc = AgentAccount.where(agent_id: id_agent).order(:id).last()
    @lastMostAgentAc = AgentAccount.order(:id).last()

    # params.fetch(:requestdata, add_account_params)
    mother_account_params = {
        main_agent_id:1, agent_id:id_agent, order_id:id_order, drAmount:var_order_amount*var_exchange_rate, crAmount:nil,
        cumulation:@lastMotherAc != nil ? @lastMotherAc.cumulation+var_order_amount*var_exchange_rate : var_order_amount*var_exchange_rate,
        date:DateTime.now, nullify_id:nil, isNullified:false, guid:SecureRandom.uuid, created_by:1
    }
    @mother = MotherAccount.new(mother_account_params)

    if @mother.save
      # save on agent's account
      agent_account_params = {
          agent_id:id_agent, mother_ac_id:@mother.id, drAmount:nil, crAmount:var_order_amount*var_exchange_rate,
          agent_cumulation:@lastAgentAc != nil ? @lastAgentAc.agent_cumulation+var_order_amount*var_exchange_rate : var_order_amount*var_exchange_rate,
          cumulation:@lastMostAgentAc != nil ? @lastMostAgentAc.cumulation+var_order_amount*var_exchange_rate : var_order_amount*var_exchange_rate,
          date:DateTime.now, nullify_id:nil, isNullified:false, guid:SecureRandom.uuid, created_by:1
      }
      @agent = AgentAccount.new(agent_account_params)

      if @agent.save
        return true
      else # rollback
        rollback(MotherAccount, @mother.id)
        return false
      end
    else
      return false
    end
  end

  def create_agent_ac(viewData, paid_by_agent)
    @lastMotherAc = MotherAccount.order(:id).last()
    @lastAgentAc = AgentAccount.where(agent_id: viewData[:agent_id]).order(:id).last()
    @lastMostAgentAc = AgentAccount.order(:id).last()

    mother_account_params = {
        main_agent_id:1, agent_id:viewData[:agent_id], drAmount:nil, crAmount:viewData[:amount],
        cumulation:@lastMotherAc != nil ? @lastMotherAc.cumulation-viewData[:amount] : viewData[:amount]*(-1),
        date:DateTime.now, nullify_id:nil, isNullified:false, guid:SecureRandom.uuid, created_by:1
    }
    @mother = MotherAccount.new(mother_account_params)

    if @mother.save
      # save on agent's account
      agent_account_params = {
          agent_id:viewData[:agent_id], mother_ac_id:@mother.id, drAmount:viewData[:amount], crAmount:nil,
          agent_cumulation:@lastAgentAc != nil ? @lastAgentAc.agent_cumulation-viewData[:amount] : viewData[:amount]*(-1),
          cumulation:@lastMostAgentAc != nil ? @lastMostAgentAc.cumulation-viewData[:amount] : viewData[:amount]*(-1),
          date:DateTime.now, nullify_id:nil, isNullified:false, isPaid:paid_by_agent, collector:viewData[:collector_name], guid:SecureRandom.uuid, created_by:1
      }
      @agent = AgentAccount.new(agent_account_params)

      if @agent.save
        return true
      else
        rollback(MotherAccount, @mother.id)
        return false
      end
    else
      return false
    end
  end

  def nullify_agent_ac(ac_agent_id)
    @agentToDelete = AgentAccount.find(ac_agent_id)
    @motherToDelete = MotherAccount.find(@agentToDelete.mother_ac_id)
    @lastMostAgentAc = AgentAccount.order(:id).last()

    if (@agentToDelete.isNullified == true || @motherToDelete.isNullified == true || @agentToDelete.crAmount != @motherToDelete.drAmount || @agentToDelete.drAmount != @motherToDelete.crAmount)
      return false
    end

    # for cumulation value
    @lastAgentAc = AgentAccount.order(:id).last()
    @lastMotherAc = MotherAccount.where(id: @lastAgentAc.mother_ac_id).order(:id).last()

    mother_account_params = {
        main_agent_id:1, agent_id:@motherToDelete.agent_id, drAmount:@motherToDelete.crAmount != nil ? @motherToDelete.crAmount : nil, crAmount:@motherToDelete.drAmount != nil ? @motherToDelete.drAmount : nil,
        cumulation:@motherToDelete.drAmount != nil ? @lastMotherAc.cumulation-@motherToDelete.drAmount : @lastMotherAc.cumulation+@motherToDelete.crAmount,
        date:DateTime.now, nullify_id:@motherToDelete.id, isNullified:true, guid:SecureRandom.uuid, created_by:1
    }
    @mother = MotherAccount.new(mother_account_params)

    if (@mother.save)
      if (@motherToDelete.update_attributes(isNullified:true, nullify_id:@mother.id, updated_by:1, updated_at:Time.now))
        agent_account_params = {
            agent_id:@motherToDelete.agent_id, mother_ac_id:@mother.id, drAmount:@agentToDelete.crAmount != nil ? @agentToDelete.crAmount : nil, crAmount:@agentToDelete.drAmount != nil ? @agentToDelete.drAmount : nil,
            agent_cumulation:@agentToDelete.crAmount != nil ? @lastAgentAc.agent_cumulation-@agentToDelete.crAmount : @lastAgentAc.agent_cumulation+@agentToDelete.drAmount,
            cumulation:@agentToDelete.crAmount != nil ? @lastMostAgentAc.cumulation-@agentToDelete.crAmount : @lastMostAgentAc.cumulation+@agentToDelete.drAmount,
            date:DateTime.now, nullify_id:@agentToDelete.id, isNullified:true, guid:SecureRandom.uuid, created_by:1
        }
        @agent = AgentAccount.new(agent_account_params)

        if (@agent.save)
          if (@agentToDelete.update_attributes(isNullified:true, nullify_id:@agent.id, updated_by:1, updated_at:Time.now))
            return true
          else
            rollback(MotherAccount, @mother.id)
            @motherToDelete.update_attributes(isNullified:false, nullify_id:nil, updated_by:nil, updated_at:nil)
            rollback(AgentAccount, @agent.id)

            return false
          end
        else
          rollback(MotherAccount, @mother.id)
          @motherToDelete.update_attributes(isNullified:false, nullify_id:nil, updated_by:nil, updated_at:nil)

          return false
        end
      else
        rollback(MotherAccount, @mother.id)
        return false
      end
    else
      return false
    end
  end

end