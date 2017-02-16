class UsersController < ApplicationController
  before_action :goto_cats

  def new
    render :new
  end

  def create
    @user = User.new(users_param)

    if @user.save
      #log user in, new session
      #session[:session_token] = @user.session_token
      login_user!
      redirect_to cats_url
    else
      flash[:errors] = @user.errors.full_messages
      #redirect_to new_user_url
      render :new
    end
  end

private
  def users_param
    params.require(:user).permit(:username, :password)
  end
end
