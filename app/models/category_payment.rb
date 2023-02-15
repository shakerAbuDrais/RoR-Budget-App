# Purpose: To create a join table between categories and payments
class CategoryPayment < ApplicationRecord
  belongs_to :category
  belongs_to :payment
end
