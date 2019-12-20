class UsersController < ApplicationController
  before_action :logged_in?, only: %i[sign_out]

  def new
    @user = User.new
  end

  def create
    @user = User.create(username: params[:username])

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def sign_in
    @user = User.find_by(username: params[:user][:username])
    if @user
    session[:user_id] = @user.id 
    flash.now[:notice] = 'Signed in as ' + @user.id.to_s
    redirect_to @user
    else
      flash.now[:notice] = 'User not found'
      render 'sign_in_page'
    end
  end

  def sign_in_page
    @user = User.new
  end

  def sign_out
    session.delete(:user_id)
    redirect_to root_path
  end

end
