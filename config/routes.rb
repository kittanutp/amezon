Rails.application.routes.draw do
  resources(:books, only: [:index, :show, :create, :update, :destroy], path: "/api/books")
  resources(:authors, only: [:index, :show, :create, :update, :destroy], path: "/api/authors")
end
