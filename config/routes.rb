Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'welcome#index'

  resources :items
  resources :warehouses
  resources :warehouse_items, only: [:new, :create]

  get '/inventory', to: 'warehouse_items#index'
end
