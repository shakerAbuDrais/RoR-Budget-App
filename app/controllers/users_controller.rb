# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Sign up successful.'
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
  end
end
