class Customer < ActiveRecord::Base
  has_many :invoices

  def favorite_merchant
    merchants = self.invoices.joins(:transactions).where(transactions: { result: "success" }).group(:merchant_id).count
    favorite_merchant = merchants.max_by { |k, v| v }
    Merchant.find(favorite_merchant[0])
  end

end
