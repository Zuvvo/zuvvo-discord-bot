Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations',
  }

  get "about", to: "about#index"

end