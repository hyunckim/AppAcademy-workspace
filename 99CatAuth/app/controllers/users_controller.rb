class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(users_param)

    if @user.save!
      render @user.to_json
    else
      render (
        errors[:User] << "can not be created!", status: :unprocessable_entity
      )
    end
  end

private
  def users_param
    params.require(:user).permit(:username, :password)
  end
end
