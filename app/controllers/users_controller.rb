class UsersController < ApplicationController
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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :password, :password_confirmation])
  end
end
