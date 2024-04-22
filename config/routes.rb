Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :comentarios
  resources :perfis
  get '/user_details', to: 'accounts#user_details'
  get '/posts_details', to: 'accounts#posts_details'
  resources :posts do
    resources :comentarios
  end
  
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    mailer: "users/mailer",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks",
    passwords: "users/passwords",
   }

   get '/change_password', to: 'passwords#edit', as: 'change_password'
   patch '/update_password', to: 'passwords#update', as: 'update_password'

  get "home/index"
  root "home#index"
  get '/search_suggestions', to: 'home#search_suggestions'
  get '/upload_post', to: 'posts#upload_post'
  match '/create_upload_post', to: 'posts#create_upload_post' , via: [:get, :post]

end
