Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get :merchants, to: "index_merchants#index"
      get :merchants, to: "show_merchants#show"
      get :merchants, to: "find_merchants#find"
      get :merchants, to: "find_all_merchants#find_all"
      get :merchants, to: "random_merchants#random"

      # resources :customers, only: [:index, :show]
      # resources :merchants, only: [:index, :show]
      # resources :items, only: [:index, :show]
      # resources :invoices, only: [:index, :show]
      # resources :transactions, only: [:index, :show]
      # resources :invoice_items, only: [:index, :show]
    end
  end
end
