Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations',
  }

  get "about", to: "about#index"
  get 'bot', to: "bot#index"
  post 'bot', to: "bot#create"
  get 'pages/home'
  root 'pages#home'

end