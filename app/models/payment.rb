class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :category_payments
  has_many :categories, through: :category_payments

  def total_amount
    "Total amount is: #{Payment.sum(:amount)}"
  end

  def self.total_amount_for_category(category_id)
    where(category_id: category_id).sum(:amount)
  end
end
