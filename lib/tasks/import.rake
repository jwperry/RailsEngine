require "csv"

namespace :import_csv do
  desc "Load DB data from CSV files"
  task import: :environment do

    CSV.foreach("./vendor/assets/csv_data/customers.csv", headers: true) do |row|
      Customer.create(row.to_h)
    end

    CSV.foreach("./vendor/assets/csv_data/merchants.csv", headers: true) do |row|
      Merchant.create(row.to_h)
    end

    CSV.foreach("./vendor/assets/csv_data/items.csv", headers: true) do |row|
      decimal_row = row.to_h
      decimal_row["unit_price"] = decimal_row["unit_price"].to_f / 100
      Item.create(decimal_row)
    end

    CSV.foreach("./vendor/assets/csv_data/invoices.csv", headers: true) do |row|
      Invoice.create(row.to_h)
    end

    CSV.foreach("./vendor/assets/csv_data/transactions.csv", headers: true) do |row|
      Transaction.create(
                         credit_card_number: row["credit_card_number"],
                         result: row["result"],
                         invoice_id: row["invoice_id"],
                         created_at: row["created_at"],
                         updated_at: row["updated_at"]
                         )
    end

    CSV.foreach("./vendor/assets/csv_data/invoice_items.csv", headers: true) do |row|
      decimal_row = row.to_h
      decimal_row["unit_price"] = decimal_row["unit_price"].to_f / 100
      InvoiceItem.create(decimal_row)
    end

  end
end
