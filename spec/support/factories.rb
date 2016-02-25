FactoryGirl.define do

  factory :merchant do
    name
    created_at "2012-03-27T14:56:35.000Z"
    updated_at "2012-03-27T14:56:35.000Z"

    factory :merchant_with_items do
      transient do
        items_count 5
      end
      after(:create) do |merchant, evaluator|
        create_list(:item, evaluator.items_count, merchant: merchant)
      end
    end

    factory :merchant_with_invoices do
      transient do
        invoices_count 5
      end
      after(:create) do |merchant, evaluator|
        create_list(:invoice, evaluator.invoices_count, merchant: merchant)
      end
    end
  end

  factory :customer do
    first_name
    last_name
    created_at "2012-03-27T14:56:35.000Z"
    updated_at "2012-03-27T14:56:35.000Z"

    factory :customer_with_invoices do
      transient do
        invoices_count 5
      end
      after(:create) do |customer, evaluator|
        create_list(:invoice, evaluator.invoices_count, customer: customer)
      end
    end
  end

  factory :invoice do
    status "shipped"
    created_at "2012-03-27T14:56:35.000Z"
    updated_at "2012-03-27T14:56:35.000Z"

    factory :invoice_with_transactions do
      transient do
        transactions_count 5
      end
      after(:create) do |invoice, evaluator|
        create_list(:transaction, evaluator.transactions_count, invoice: invoice)
      end
    end

    factory :invoice_with_invoice_items do
      transient do
        invoice_items_count 5
      end
      after(:create) do |invoice, evaluator|
        create_list(:invoice_item, evaluator.invoice_items_count, invoice: invoice)
      end
    end

    factory :invoice_with_items do
      after(:create) do |invoice|
        5.times do
          invoice.items << FactoryGirl.create(:item)
        end
      end
    end
  end

  factory :item do
    name
    description
    unit_price
    created_at "2012-03-27T14:56:35.000Z"
    updated_at "2012-03-27T14:56:35.000Z"

    factory :item_with_invoice_items do
      transient do
        invoice_items_count 5
      end
      after(:create) do |item, evaluator|
        create_list(:invoice_item, evaluator.invoice_items_count, item: item)
      end
    end

    factory :item_with_invoices do
      after(:create) do |item|
        5.times do
          item.invoices << FactoryGirl.create(:invoice)
        end
      end
    end
  end

  factory :transaction do
    credit_card_number
    result
    created_at "2012-03-27T14:56:35.000Z"
    updated_at "2012-03-27T14:56:35.000Z"
  end

  factory :invoice_item do
    quantity
    unit_price
    created_at "2012-03-27T14:56:35.000Z"
    updated_at "2012-03-27T14:56:35.000Z"
  end

  sequence :name do |n|
    "name#{n}"
  end

  sequence :first_name do |n|
    "first_name#{n}"
  end

  sequence :last_name do |n|
    "last_name#{n}"
  end

  sequence :credit_card_number do |n|
    "0"*(16-n.to_s.length) + "#{n}"
  end

  sequence :result, ["success", "failed"].cycle do |n|
    n
  end

  sequence :description do |n|
    "description#{n}"
  end

  sequence :unit_price do |n|
    ((n+1)*1000).to_d
  end

  sequence :quantity do |n|
    n*10
  end
end
