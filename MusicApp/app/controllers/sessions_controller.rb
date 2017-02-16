class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["Invald email and/or password"]
      render :new
    else
      login_user!(user)
      redirect_to user_url(user)
    end
  end
end
