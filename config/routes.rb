Rails.application.routes.draw do
  post 'sessions/create'
  post 'sessions/new'
  get 'sessions/destroy'
  get 'work/index'
  post 'work/show_framework'
  post 'work/freamvote'
  put 'work/new_framework'
  get 'work/borrowed'
  get 'work/themes'
  root "main#index"

  get 'main/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
