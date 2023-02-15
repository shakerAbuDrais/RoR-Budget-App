class Category < ApplicationRecord
  belongs_to :user
  has_many :category_payments
  has_many :payments, through: :category_payments

  validates :name, presence: true
  validates :icon, presence: true

  def total_payments_amount
    payments.sum(:amount)
  end
end
