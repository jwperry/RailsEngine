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

      get :transactions, to: "index_transactions#index"
      get :transactions, to: "show_transactions#show"
      get :transactions, to: "find_transactions#find"
      get :transactions, to: "find_all_transactions#find_all"
      get :transactions, to: "random_transactions#random"

      get :invoices, to: "index_invoices#index"
      get :invoices, to: "show_invoices#show"
      get :invoices, to: "find_invoices#find"
      get :invoices, to: "find_all_invoices#find_all"
      get :invoices, to: "random_invoices#random"
    end
  end
end
