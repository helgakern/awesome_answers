class UsersController < ApplicationController
  def new
    @user = User.new
    # form_with uses an instance to create a form
  end

  def create
    @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    if @user.save
      flash.delete(:warning)
      redirect_to questions_path
    else
      flash[:warning] = "unable to create user"
      render :new
    end
  end
end
