class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login_user!(@user)
      redirect_to root_url
    else
      flash[:errors] ||= []
      flash.now[:errors] << "Invalid username / password combination"
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
