class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(username: params[:username])

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  end

  

  def sign_in
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id if @user
    flash.now[:notice] = 'Signed in as ' + @user.id.to_s
    render 'sign_in'
  end
end
