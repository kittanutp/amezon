Rails.application.routes.draw do
  resources(:books, only: [:index, :show, :create, :update, :destroy], path: "/api/books")
  resources(:authors, only: [:index, :show, :create, :update, :destroy], path: "/api/authors")
  post "/api/user", to: 'user#create'
  post "/api/login", to: 'auth#create'
end
