class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_destroyed

  private

  def not_destroyed(e)
    render json: "There is no user with id: #{params[:id]}", status: :unprocessable_entity
  end
end
