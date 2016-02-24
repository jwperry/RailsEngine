Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get :merchants, to: "index_merchants#index"
      get :merchants, to: "show_merchants#show"
      get :merchants, to: "find_merchants#find"
      get :merchants, to: "find_all_merchants#find_all"
      get :merchants, to: "random_merchants#random"

      get :customers, to: "index_customers#index"
      get :customers, to: "show_customers#show"
      get :customers, to: "find_customers#find"
      get :customers, to: "find_all_customers#find_all"
      get :customers, to: "random_customers#random"
    end
  end
end
