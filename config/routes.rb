Rails.application.routes.draw do
  root 'people#index'
  get 'home/about'
  resources :phone_numbers
  resources :emails
  resources :addresses
  resources :people
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
