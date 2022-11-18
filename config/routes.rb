Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
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
  get 'math_game/new'

  get '/discord_users/:id', to: 'discord_user#show', as: 'discord_user'

end