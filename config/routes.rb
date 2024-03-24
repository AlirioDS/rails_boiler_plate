Rails.application.routes.draw do
  root to: redirect('/dashboard')
  
  devise_for :users, skip: [:sessions]

  devise_scope :user do
    # sessions
    get 'sign_in', to: 'users/sessions#new', as: :new_user_session
    post 'sign_in', to: 'users/sessions#create', as: :user_session
    delete 'sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  get '/dashboard', to: 'dashboard#index', as: :dashboard
end
