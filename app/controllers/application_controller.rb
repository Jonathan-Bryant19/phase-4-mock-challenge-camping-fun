class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :not_valid

  private

  def not_found(not_found)
    render json: { error: "#{not_found.model} not found" }, status: :not_found
  end

  def not_valid(invalid)
    render json: { errors: [invalid.record.errors.full_messages] }, status: 422
  end

end
