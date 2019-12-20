module UsersHelper
  # returns the user object of the currently logged-in user
  def current_user
   return User.find(session[:user_id]) if session[:user_id]
   false
  end

  # returns true if the date given has already past
  def event_past?(date)
    return unless date

    return true if Date.today > date

    false
  end
end
