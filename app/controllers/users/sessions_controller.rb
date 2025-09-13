# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      if resource.persisted?
        redirect_to dashboard_path and return
      else
        redirect_to user_session_path and return
      end
    end
  end

  private

  def after_sign_out_path_for(_resource_or_scope)
    user_session_path
  end
end
