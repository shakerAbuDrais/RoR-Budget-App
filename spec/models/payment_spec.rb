require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:category) }
  it { should have_many(:category_payments) }
  it { should have_many(:categories).through(:category_payments) }

  it { should validate_presence_of(:amount) }

  describe "#total_amount" do
    it "returns the total amount of all payments" do
      create(:payment, amount: 100)
      create(:payment, amount: 200)

      expect(Payment.last.total_amount).to eq("Total amount is: 300.0")
    end
  end

  describe ".total_amount_for_category" do
    it "returns the total amount for a specific category" do
      category = create(:category)
      create(:payment, amount: 100, category: category)
      create(:payment, amount: 200, category: category)

      expect(Payment.total_amount_for_category(category.id)).to eq(300)
    end
  end
end
