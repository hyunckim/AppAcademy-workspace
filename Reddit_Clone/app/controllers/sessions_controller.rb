class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:username],
      session_params[:password])

    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid username and/or password"]
      render :new
    end
  end

  def destroy
    @user = current_user
    if @user
      logout!(@user)
      render :new
    else
      flash.now[:errors] = ["You are already logged out!"]
      render :new
    end
  end

  private
    def session_params
      params.require(:user).permit(:username, :password)
    end
end
