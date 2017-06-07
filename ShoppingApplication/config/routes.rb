Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'products/:id'  => 'products#show'
  root 'types#index'
  resources :types
  resources :products
end
