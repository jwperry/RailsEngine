class CreateInvoices < ActiveRecord::Migration
  def change
    enable_extension("citext")
    create_table :invoices do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :merchant, index: true, foreign_key: true
      t.citext :status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
