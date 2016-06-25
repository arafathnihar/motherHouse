class Api::V1::LoginController < ApplicationController

  skip_before_filter  :verify_authenticity_token
  before_filter :authenticate

  # def index
  #   @thispara = ApiKey.all
  #
  #   render json: @thispara.as_json, status: :ok
  # end

  def create
    existing = ApiKey.where(user_id: @user.id, status: true)

    if (existing.count == 0)
      token = ApiKey.create(user_id: @user.id, expires_at: DateTime.now + 48.hours, status: true)
    elsif (existing.count == 1)
      token = existing
    end # write code to remove the rest

    render json: token.as_json, status: :ok
  end

  def delete
    # destroy basic login
    existing = ApiKey.where(user_id: @user.id, status: true)

    existing.each do |token|
      existing.update(token.id, status: false)
    end

    render json: existing.as_json, status: :ok
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|

      @user = User.find_by_username(username) # shiva

      username == @user.username
      # password == @user.password
      _password = Digest::SHA1.hexdigest(password)
      _password == @user.password
    end
  end

  # http_basic_authenticate_with name: @username_, password: @password_
  # respond_to :json
  #
  # def index
  #   @thispara = ApiKey.all
  #
  #   render json: @thispara.as_json, status: :ok
  # end
  #
  # user = User.find_by_username(params[:name]) # shiva
  #
  # @username_ = user.username
  # @password_ = user.password
end
