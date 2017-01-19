class UsersController < ApplicationController
  before_action :user_is_logged_in

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!
      email = UserMailer.welcome_email(@user)
      email.deliver
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:users).permit(:username, :password)
  end

end
