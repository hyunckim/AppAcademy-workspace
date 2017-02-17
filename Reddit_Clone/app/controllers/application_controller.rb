class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!(user)
    session[:session_token] = nil
    user.reset_session_token!
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    unless logged_in?
      flash[:errors] = ["You must login before this action"]
      redirect_to new_session_url
    end
  end

  def require_moderator
    @sub = Sub.find(sub_params[:id])
    @sub.moderator_id == current_user.id
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end
end
