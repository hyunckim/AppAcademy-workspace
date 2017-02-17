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
    @sub = Sub.find(params[:id])
    unless @sub.moderator_id == current_user.id
      flash[:errors] = ["You can't edit someone else's sub"]
      redirect_to subs_url
    end
  end

  def require_author
    @post = Post.find(params[:id])
    unless @post.author_id == current_user.id || @post.moderator.id == current_user.id
      flash[:errors] = ["You can't edit someone else's post"]
      redirect_to post_url(@post)
    end
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end
end
