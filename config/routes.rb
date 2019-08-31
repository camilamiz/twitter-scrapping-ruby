Rails.application.routes.draw do
  resources :twitter_users, only: [:index, :new, :create, :show]
end
