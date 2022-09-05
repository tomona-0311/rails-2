Rails.application.routes.draw do
  get 'posts/index'
  get 'users/index'
  get 'lessons/hello', to: 'lessons#hello'
   get 'lessons/call', to: 'lessons#call'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :posts

 
end
