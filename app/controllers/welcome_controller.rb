# Class: WelcomeController
class WelcomeController < ApplicationController
  def index
    @title = 'Welcome'
    return unless user_signed_in?

    redirect_to categories_path
  end
end
