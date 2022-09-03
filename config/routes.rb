Rails.application.routes.draw do
  root 'people#index'
  
  resources :people do
    resources :emails
    resources :phone_numbers
    resources :addresses
  end
end
