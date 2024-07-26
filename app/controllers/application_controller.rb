class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def authenticate_user!
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this
    action"
  end
end

