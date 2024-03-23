Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  } do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
end
