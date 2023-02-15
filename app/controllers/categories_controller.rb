# This controller is responsible for handling the categories
class CategoriesController < ApplicationController
  def index
    @title = 'Categories'
    @categories = Category.where(user_id: current_user.id)
    @total_amount = Payment.where(category_id: params[:id]).sum(:amount)
  end

  def show
    @category = Category.find(params[:id])
    @payments = Payment.where(category_id: @category.id)
  end

  def new
    @title = 'New Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to root_path, notice: 'Category created successfully!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
