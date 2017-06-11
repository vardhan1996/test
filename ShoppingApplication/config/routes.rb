Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'products/:id'  => 'products#show'
  #root 'types#index'
  resources :types
  resources :products
  get '/:id' => 'home#show', as: 'admin_product'
end
