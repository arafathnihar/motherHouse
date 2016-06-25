class ApplicationSecureController < ActionController::Base

  protect_from_forgery with: :null_session

  before_filter :restrict_access # check token in all child classes

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

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
end
