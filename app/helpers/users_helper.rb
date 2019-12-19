module UsersHelper
  def current_user
   if session[:user_id]
    return User.find(session[:user_id]).username
   end
  end
end
