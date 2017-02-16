class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    current_session = session[:session_token]

    User.find_by_session_token(current_session)
  end

  def login_user!
    #raise error unless self.is_a?(User)
    session_token = @user.reset_session_token!
    session[:session_token] = session_token
  end

  def goto_cats
    redirect_to cats_url if session[:session_token]
  end
end
