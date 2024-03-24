# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    if !current_user
      redirect_to user_session_path
    else
      redirect_to dashboard_path
    end
  end

  private

  def after_sign_out_path_for(_resource_or_scope)
    user_session_path
  end
end
