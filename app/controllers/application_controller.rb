class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :log_request

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from StandardError, with: :internal_server_error

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password remember_me])
  end

  private

  def user_not_authorized(exception)
    logger.warn "Unauthorized access attempt by #{current_user&.email || 'anonymous'} to #{request.path}"
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || dashboard_path)
  end

  def record_not_found(exception)
    logger.error "Record not found: #{exception.message}"
    render file: Rails.root.join('public', '404.html'), status: :not_found, layout: false
  end

  def internal_server_error(exception)
    logger.error "Internal server error: #{exception.message}\n#{exception.backtrace.join("\n")}"
    render file: Rails.root.join('public', '500.html'), status: :internal_server_error, layout: false
  end

  def log_request
    if current_user
      logger.info "User #{current_user.email} (#{current_user.role.name}) accessed #{request.path}"
    else
      logger.info "Anonymous user accessed #{request.path}"
    end
  end
end
