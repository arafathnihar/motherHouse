class Api::V1::OrdersController < ApplicationController

  # before_action :authenticate
  before_action except: [:index, :create]
  respond_to :json

  def index
    @thispara = Order.where(status: 1)

    render json: @thispara.as_json(include: [:agent, :receiving_agent, :receiver, :order_currency, :supply_currency]), status: :ok
  end

  def create
    @thispara = Receiver.new(params_receivers)

    @thispara.guid = SecureRandom.uuid
    @thispara.created_by = 1

    begin
      @thispara.save
      @thispara2 = Order.new(params_orders)

      @thispara2.customId = custom_id(Order, "OR", 5)
      @thispara2.receiver_id = @thispara.id
      @thispara2.guid = SecureRandom.uuid
      @thispara2.created_by = 1

      begin
        @thispara2.save
        # create account record
        begin
          AccountService.new().create_mother_ac(@thispara2.agent_id, @thispara2.id, @thispara2.orderAmount, @thispara2.exchangeRate, @thispara2.orderDate)
          # render json: { message: "Success" }, status: :ok
          render json: combine_request(@thispara, @thispara2).as_json, status: :ok
        rescue Exception => exc1 # rollback code here
          rollback(Order, @thispara2.id)
          rollback(Receiver, @thispara.id)
          render json: { errors2: @mother.errors }, status: :unprocessable_entity
        end
      rescue Exception => exc3
        #roll back
        rollback(Receiver, @thispara.id)
        render json: { errors1: @thispara2.errors }, status: :unprocessable_entity
      end
    rescue Exception => exc2
      render json: { errors2: @thispara.errors }, status: :unprocessable_entity
    end
  end

  def show
    @thispara = Order.where(status: 1).find(params[:id])

    render json: @thispara.as_json(include: [:agent, :receiving_agent, :receiver, :order_currency, :supply_currency]), status: :ok
  end

  def update
    if @thispara.update_attributes(params_orders.merge(updated_by: 1, updated_at: Time.now))

      @thispara2 = Receiver.find(@thispara.receiver_id)

      begin
        @thispara2.update_attributes(params_receivers.merge(updated_by: 1, updated_at:Time.now))
        begin
          (AccountService.new().nullify_mother_ac(params[:id]))
          begin
            (AccountService.new().create_mother_ac(@thispara.agent_id, @thispara.id, @thispara.orderAmount, @thispara.exchangeRate, @thispara.orderDate))
            render json: combine_request(@thispara, @thispara2).as_json, status: :ok
          rescue Exception => exc1
            # rollback
            render json: { message: "Failed" }, status: :unprocessable_entity
          end
        rescue Exception => exc2
          # rollback
          render json: { message: "Failed" }, status: :unprocessable_entity
        end
      rescue Exception => exc3
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
      begin
        (@thispara2.update_attributes(status:2, updated_by:1, updated_at:Time.now))
        begin
          (AccountService.new().nullify_mother_ac(params[:id]))
          render json: { message: "Success" }, status: :ok
        rescue Exception => exc1
          @thispara.update_attributes(status:1, updated_by:nil, updated_at:nil)
          @thispara2.update_attributes(status:1, updated_by:nil, updated_at:nil)
        end
      rescue Exception => exc2
        @thispara.update_attributes(status:1, updated_by:nil, updated_at:nil)
        render json: @thispara.errors, status: :unprocessable_entity
      end
    else
      render json: @thispara.errors, status: :unprocessable_entity
    end
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
