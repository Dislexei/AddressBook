Rails.application.routes.draw do
  # get 'admin/index'
  
  get 'admin' => 'admin#index'


  controller :sessions do
    get     'login'   => :new
    post    'login'   => :create
    delete  'logout'  => :destroy
  end

  resources :users
  root 'people#index'
  

  resources :people do
    resources :emails
    resources :phone_numbers
    resources :addresses
  end
  resources :emails
  resources :phone_numbers
  resources :addresses
end
