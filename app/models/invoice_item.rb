class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  default_scope { order('id ASC') }
end
