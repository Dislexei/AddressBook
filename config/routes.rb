Rails.application.routes.draw do
  root 'people#index'
  get 'home/about'
  
  resources :people do
    resources :emails
    resources :phone_numbers
    resources :addresses
  end
end
