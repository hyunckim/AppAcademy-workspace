class SessionsController < ApplicationController
  before_action :goto_cats, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login_user!
      redirect_to cats_url
    else
      flash[:errors] = "invalid user or password"
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
    def login_params
      params.require(:user).permit(:username, :password)
    end
end
