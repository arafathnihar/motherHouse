class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session
  # protect_from_forgery with: :exception

  def custom_id (model, letters, number_size)
    model_id = model.order("id").last.id
    number_string = (model_id + 1).to_s.rjust(number_size, "0")

    return letters.upcase + number_string
  end
end
