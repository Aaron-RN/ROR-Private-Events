class ApplicationController < ActionController::Base
  include UsersHelper
  
  private
  def logged_in?
    unless current_user 
      flash[:notice] = 'Please, login!'
      redirect_to sign_in_path 
    end
  end
end
