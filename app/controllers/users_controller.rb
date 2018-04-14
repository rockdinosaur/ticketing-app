class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # session[:user_id] = @user.id (if we want auto-login after registration)
      flash[:notice] = "You are registered."
      redirect_to root_path
    else
      flash[:error] = ""
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end
end
