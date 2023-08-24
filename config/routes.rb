Rails.application.routes.draw do
  devise_for :users
  get 'products/index'
  root to: "products#index"
  
  resources :products do
    resources :purchase_records, only: [:index, :create]
  end
end
