# rubocop:disable all
# Class: PaymentsController
class PaymentsController < ApplicationController
  before_action :set_category
  before_action :set_payment, only: %i[show edit update destroy]

  def index
    @title = 'Transactions'
    @payments = @category.payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
  end

  def show
    @title = 'Transactions'
    @payments = @category.payments.order(created_at: :desc)
  end

  def new
    @title = 'Add New Transaction'
    @payment = @category.payments.build
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user = current_user
    selected_category_ids = params[:payment]&.fetch(:category_ids, []) || []
    @payment.category_id = selected_category_ids.first unless selected_category_ids.empty?

    if selected_category_ids.empty?
      flash.now[:alert] = "Please select at least one category"
      render :new
    elsif @payment.save
      selected_category_ids.each do |category_id|
        category = Category.find(category_id)
        category.payments << @payment unless category.payments.include?(@payment)
      end
      redirect_to category_payments_path(@payment.category), notice: 'Payment was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @payment.update(payment_params)
      redirect_to category_payments_path(@category), notice: 'Payment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @payment.destroy
    redirect_to category_payments_path(@category), notice: 'Payment was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, category_ids: [])
  end
end
