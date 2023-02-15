class Category < ApplicationRecord
  belongs_to :user
  has_many :category_payments
  has_many :payments, through: :category_payments

  def total_payments_amount
    payments.sum(:amount)
  end
end
