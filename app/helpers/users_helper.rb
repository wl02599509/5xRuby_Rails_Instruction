module UsersHelper
  def current_user
    User.find_by(id: session[:user_session])
  end
end
