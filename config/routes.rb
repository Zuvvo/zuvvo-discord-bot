Rails.application.routes.draw do
  get 'math_game/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations',
  }

  get "about", to: 'about#index'
  get 'bot', to: 'bot#index'
  post 'bot', to: 'bot#create'
  get 'pages/home'
  root 'pages#home'
  post 'math_game', to: 'math_game#create'
  get 'math_game', to: 'math_game#home'

end