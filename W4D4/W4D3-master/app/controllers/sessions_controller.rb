class SessionsController < ApplicationController
  before_action :user_is_logged_in, except: [:destroy]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      log_in_user!
      redirect_to cats_url
    else
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end


end
