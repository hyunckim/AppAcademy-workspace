class UsersController < ApplicationController
  # before_action :require_no_user!
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(users_param)
    if @user.save!
      #login user after signing in login_user!(@user)
      redirect_to
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
    def users_param
      params.require(:users).permit(:email, :password)
    end
end
