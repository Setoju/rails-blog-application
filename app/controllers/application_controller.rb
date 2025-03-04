class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user
    if Current.user.nil?
      flash[:alert] = "You must be signed in to view your profile"
      redirect_to sign_in_path
    end
  end

  allow_browser versions: :modern
end
