class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  private

  def authenticate_user!
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
