Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/merchants", to: "index_merchants#index"
      get "/merchants/find", to: "find_merchants#find"
      get "/merchants/find_all", to: "find_all_merchants#find_all"
      get "/merchants/random", to: "random_merchants#random"
      get "/merchants/:id/items", to: "items_merchants#items"
      get "/merchants/:id/invoices", to: "invoices_merchants#invoices"
      get "/merchants/:id", to: "show_merchants#show"

      get "/customers", to: "index_customers#index"
      get "/customers/find", to: "find_customers#find"
      get "/customers/find_all", to: "find_all_customers#find_all"
      get "/customers/random", to: "random_customers#random"
      get "/customers/:id/favorite_merchant", to: "favorite_merchant_customers#favorite_merchant"
      get "/customers/:id/invoices", to: "invoices_customers#invoices"
      get "/customers/:id/transactions", to: "transactions_customers#transactions"
      get "/customers/:id", to: "show_customers#show"

      get "/transactions", to: "index_transactions#index"
      get "/transactions/find", to: "find_transactions#find"
      get "/transactions/find_all", to: "find_all_transactions#find_all"
      get "/transactions/random", to: "random_transactions#random"
      get "/transactions/:id/invoice", to: "invoice_transactions#invoice"
      get "/transactions/:id", to: "show_transactions#show"

      get "/invoices", to: "index_invoices#index"
      get "/invoices/find", to: "find_invoices#find"
      get "/invoices/find_all", to: "find_all_invoices#find_all"
      get "/invoices/random", to: "random_invoices#random"
      get "/invoices/:id/transactions", to: "transactions_invoices#transactions"
      get "/invoices/:id/invoice_items", to: "invoice_items_invoices#invoice_items"
      get "/invoices/:id/items", to: "items_invoices#items"
      get "/invoices/:id/customer", to: "customer_invoices#customer"
      get "/invoices/:id/merchant", to: "merchant_invoices#merchant"
      get "/invoices/:id", to: "show_invoices#show"

      get "/items", to: "index_items#index"
      get "/items/find", to: "find_items#find"
      get "/items/find_all", to: "find_all_items#find_all"
      get "/items/random", to: "random_items#random"
      get "/items/:id/invoice_items", to: "invoice_items_items#invoice_items"
      get "/items/:id/merchant", to: "merchant_items#merchant"
      get "/items/:id", to: "show_items#show"

      get "/invoice_items", to: "index_invoice_items#index"
      get "/invoice_items/find", to: "find_invoice_items#find"
      get "/invoice_items/find_all", to: "find_all_invoice_items#find_all"
      get "/invoice_items/random", to: "random_invoice_items#random"
      get "/invoice_items/:id/invoice", to: "invoice_invoice_items#invoice"
      get "/invoice_items/:id/item", to: "item_invoice_items#item"
      get "/invoice_items/:id", to: "show_invoice_items#show"
    end
  end
end
