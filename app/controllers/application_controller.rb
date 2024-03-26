class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password remember_me])
  end  

  def authenticate_user!
    if !current_user
      redirect_to user_session_path
    end
  end
end
