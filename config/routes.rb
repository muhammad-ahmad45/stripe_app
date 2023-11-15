Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "products#index"
  resources :products
  post "checkout/create", to: "checkout#create"
  
end
