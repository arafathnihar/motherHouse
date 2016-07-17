class Api::V1::OrdersController < ApplicationController

  # before_action :authenticate
  before_action :get_orders, except: [:index, :create]
  respond_to :html, :json

  def index
    @thispara = Order.all

    render json: @thispara.as_json(include: [:agent, :receiving_agent, :receiver, :order_currency, :supply_currency]), status: :ok
  end

  def create
    @thispara = Receiver.new(params_receivers)

    @thispara.guid = SecureRandom.uuid
    @thispara.created_by = 1

    # begin
    if  @thispara.save
      @thispara2 = Order.new(params_orders)

      @thispara2.customId = custom_id(Order, "OR", 5)
      @thispara2.receiver_id = @thispara.id
      @thispara2.guid = SecureRandom.uuid
      @thispara2.created_by = 1

      # begin
      if @thispara2.save
        # create account record
        if (AccountService.new().create_mother_ac(@thispara2.agent_id, @thispara2.id, @thispara2.orderAmount, @thispara2.exchangeRate))
          # render json: { message: "Success" }, status: :ok
          render json: combine_request(@thispara, @thispara2).as_json, status: :ok
        else # rollback code here
          rollback(Order, @thispara2.id)
          rollback(Receiver, @thispara.id)
          render json: { errors2: @mother.errors }, status: :unprocessable_entity
        end
      else #rescue Exception => exc1
        #roll back
        rollback(Receiver, @thispara.id)
        render json: { errors1: @thispara2.errors }, status: :unprocessable_entity
      end
    else #rescue Exception => exc2
      render json: { errors2: @thispara.errors }, status: :unprocessable_entity
    end
  end

  def show
    # @thispara2 = Order.find(@thispara.receiverId)

    render json: @thispara.as_json(include: [:agent, :receiving_agent, :receiver, :order_currency, :supply_currency]), status: :ok
  end

  def update
    if @thispara.update_attributes(params_orders.merge(updated_by: 1, updated_at: Time.now))

      @thispara2 = Receiver.find(@thispara.receiver_id)

      if @thispara2.update_attributes(params_receivers.merge(updated_by: 1, updated_at:Time.now))
        if (AccountService.new().nullify_mother_ac(params[:id]))
          if (AccountService.new().create_mother_ac(@thispara.agent_id, @thispara.id, @thispara.orderAmount, @thispara.exchangeRate))
            render json: combine_request(@thispara, @thispara2).as_json, status: :ok
          else
            # rollback
            render json: { message: "Failed" }, status: :unprocessable_entity
          end
        else
          # rollback
          render json: { message: "Failed" }, status: :unprocessable_entity
        end
      else
        # rollback
        render json: { errors: @thispara2.errors }, status: :unprocessable_entity
      end

    else
      render json: { errors: @thispara.errors }, status: :unprocessable_entity
    end
  end

  def destroy # try to return true false
    @thispara = Order.find(params[:id])
    @thispara2 = Receiver.find(@thispara.receiver_id)

    if (@thispara.update_attributes(status:2, updated_by:1, updated_at:Time.now))
      if (@thispara2.update_attributes(status:2, updated_by:1, updated_at:Time.now))
        if (AccountService.new().nullify_mother_ac(params[:id]))
          render json: { message: "Success" }, status: :ok
        else
          @thispara.update_attributes(status:1, updated_by:nil, updated_at:nil)
          @thispara2.update_attributes(status:1, updated_by:nil, updated_at:nil)
        end
      else
        @thispara.update_attributes(status:1, updated_by:nil, updated_at:nil)
        render json: @thispara.errors, status: :unprocessable_entity
      end
    else
      render json: @thispara.errors, status: :unprocessable_entity
    end
  end

  # put into common controller
  def rollback(model, record_id)
    @thispara = model.find(record_id)
    @thispara.destroy
  end

  private

  def get_orders
    @thispara = Order.find(params[:id])
    render json: {status: :not_found} unless @thispara
  end

  def params_orders
    params.fetch(:requestdata, {})
        .permit(
            :agent_id,
            :receiving_agent_id,
            :orderAmount,
            :order_curr_id,
            :supply_curr_id,
            :exchangeRate,
            :orderDate,
            :orderStatus
        )
  end

  def params_receivers
    params.fetch(:requestdata, {})
        .permit(
            :name,
            :contact,
            :country_id,
            :bankName,
            :branchName,
            :bankAcNo
        )
  end
end
