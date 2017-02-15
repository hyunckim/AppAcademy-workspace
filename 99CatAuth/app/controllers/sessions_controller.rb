class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if user
      session_token = user.reset_session_token!
      session[:session_token] = session_token
      redirect_to cats_url
    else
      #show/flash error?
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
  end

  private
    def login_params
      params.require(:user).permit(:username, :password)
    end
end
