class Api::OrdersController < ApplicationController

  before_action :get_orders, except: [:index, :create]
  respond_to :html, :json

  def index
    array = []
    @thispara = Order.all

    @thispara.each do |order|
      @receiver = Receiver.find(order.receiverId)

      array.push(combine_request(order, @receiver))
    end

    render json: array.as_json, status: :ok
  end

  def create
    @thispara = Receiver.new(params_receivers)

    @thispara.customId = custom_id(Receiver, "RP", 5)
    @thispara.guid = SecureRandom.uuid
    @thispara.created_by = 1

    # begin
    if  @thispara.save
      @thispara2 = Order.new(params_orders)

      @thispara2.customId = custom_id(Order, "OR", 5)
      @thispara2.receiverId = @thispara.id
      @thispara2.guid = SecureRandom.uuid
      @thispara2.created_by = 1

      # begin
      if @thispara2.save
        render json: combine_request(@thispara, @thispara2).as_json, status: :ok
      else #rescue Exception => exc1
        #roll back
        rollback(@thispara.id)

        render json: {user: @thispara2.errors, status: :no_content}
      end
    else #rescue Exception => exc2
      render json: {user: @thispara.errors, status: :no_content}
    end
  end

  def show
    @thispara2 = Receiver.find(@thispara.receiverId)

    render json: combine_request(@thispara, @thispara2).as_json, status: :ok
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
      render json: {user: @thispara.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    @thispara = Order.find(params[:id])
    @thispara.destroy

    @thispara = Receiver.find(@thispara.receiverId)
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

  def combine_request(result1, result2)
    mrg = []
    mrg.push(result1)
    mrg.push(result2)

    return mrg
  end

  def params_orders
    params.fetch(:requestdata, {})
        .permit(
            :agentId,
            :receivingAgentId,
            :orderAmount,
            :orderCurrId,
            :supplyCurrId,
            :exchangeRate,
            :date,
            :orderStatus
        )
  end

  def params_receivers
    params.fetch(:requestdata, {})
        .permit(
            :name,
            :contact,
            :countryId
        )
  end
end
