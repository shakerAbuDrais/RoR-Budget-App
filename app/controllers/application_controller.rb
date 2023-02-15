# This is the base controller for all other controllers in the application.
class ApplicationController < ActionController::Base
  before_action :set_title

  private

  def set_title
    @title = "#{controller_name.titleize} | #{action_name.titleize}"
  end
end
