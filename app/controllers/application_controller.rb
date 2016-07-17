class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session

  # skip_before_filter  :verify_authenticity_token

  # protect_from_forgery with: :exception

  def combine_request(result1, result2)
    mrg = []
    mrg.push(result1)
    mrg.push(result2)

    return mrg
  end

  def custom_id (model, letters, number_size)
    model_id = model.exists? ? model.order("id").last.id : 0
    number_string = (model_id + 1).to_s.rjust(number_size, "0")

    return letters.upcase + number_string
  end

  def rollback(model, record_id)
    @thispara = model.find(record_id)
    @thispara.destroy
  end

  # protected
  # def authenticate
  #   authenticate_or_request_with_http_token do |token, options|
  #     User.find_by(auth_token: token)
  #   end
  # end
end
