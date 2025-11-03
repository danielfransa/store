Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "sales#index" # página inicial mostra as vendas, por exemplo

  resources :clients
  resources :locations

  resources :products do
    resources :skus, shallow: true
  end

  resources :skus, only: [] do
    resources :inventories, shallow: true
  end

  resources :sales do
    resources :sale_items, shallow: true
  end
end
