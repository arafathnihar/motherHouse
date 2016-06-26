class Api::V1::OrdersController < ApplicationController

  # before_action :authenticate
  before_action :get_orders, except: [:index, :create]
  respond_to :html, :json

  def index
    @thispara = Order.all

    render json: @thispara.as_json(include: [:receiver, :currency, :currency]), status: :ok
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
        render json: combine_request(@thispara, @thispara2).as_json, status: :ok
      else #rescue Exception => exc1
        #roll back
        rollback(@thispara.id)
        render json: { errors1: @thispara2.errors }, status: :unprocessable_entity
      end
    else #rescue Exception => exc2
      render json: { errors2: @thispara.errors }, status: :unprocessable_entity
    end
  end

  def show
    # @thispara2 = Order.find(@thispara.receiverId)

    render json: @thispara.as_json(include: [:receiver, :currency]), status: :ok
  end

  def update
    if @thispara.update_attributes(params_orders.merge(updated_by: 1, updated_at: Time.now))

      @thispara2 = Receiver.find(@thispara.receiverId)

      if @thispara2.update_attributes(params_receivers.merge(updated_by: 1, updated_at:Time.now))
        render json: combine_request(@thispara, @thispara2).as_json, status: :ok
      else
        render json: @thispara.as_json, status: :ok
      end

    else
      render json: { errors: @thispara.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @thispara = Order.find(params[:id])
    @thispara.destroy

    @thispara = Receiver.find(@thispara.receiver_id)
    @thispara.destroy

    render json: {status: :ok}
  end

  def rollback(receiver_id)
    @thispara = Receiver.find(receiver_id)
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
