class Payment < ApplicationRecord
  belongs_to :user
  has_many :category_payments
  has_many :categories, through: :category_payments
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true
end
