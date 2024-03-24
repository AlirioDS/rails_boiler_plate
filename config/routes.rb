Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  } do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  get '/', to: 'dashboard#index', as: :dashboard
end
