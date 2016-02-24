Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/merchants", to: "index_merchants#index"
      get "/merchants/find", to: "find_merchants#find"
      get "/merchants/find_all", to: "find_all_merchants#find_all"
      get "/merchants/random", to: "random_merchants#random"
      get "/merchants/:id", to: "show_merchants#show"

      get "/customers", to: "index_customers#index"
      get "/customers/find", to: "find_customers#find"
      get "/customers/find_all", to: "find_all_customers#find_all"
      get "/customers/random", to: "random_customers#random"
      get "/customers/:id", to: "show_customers#show"

      get "/transactions", to: "index_transactions#index"
      get "/transactions/find", to: "find_transactions#find"
      get "/transactions/find_all", to: "find_all_transactions#find_all"
      get "/transactions/random", to: "random_transactions#random"
      get "/transactions/:id", to: "show_transactions#show"

      get "/invoices", to: "index_invoices#index"
      get "/invoices/find", to: "find_invoices#find"
      get "/invoices/find_all", to: "find_all_invoices#find_all"
      get "/invoices/random", to: "random_invoices#random"
      get "/invoices/:id", to: "show_invoices#show"

      get "/items", to: "index_items#index"
      get "/items/find", to: "find_items#find"
      get "/items/find_all", to: "find_all_items#find_all"
      get "/items/random", to: "random_items#random"
      get "/items/:id", to: "show_items#show"
    end
  end
end
