class PaymentsController < ApplicationController
  before_action :set_category
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def index
    @payments = @category.payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
  end

  def show
  end

  def new
    @payment = @category.payments.build
  end

  def create
    @payment = @category.payments.build(payment_params)

    if @payment.save
      redirect_to category_payments_path(@category), notice: 'payment was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @payment.update(payment_params)
      redirect_to category_payments_path(@category), notice: 'payment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @payment.destroy
    redirect_to category_payments_path(@category), notice: 'payment was successfully destroyed.'
  end

  private
    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_payment
      @payment = @category.payments.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :description, :date)
    end
end
