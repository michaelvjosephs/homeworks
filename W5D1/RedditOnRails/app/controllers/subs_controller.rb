class SubsController < ApplicationController
  before_action :require_logged_in
  before_action :require_moderator, only: [:edit, :update, :destroy]

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] ||= []
      flash.now[:errors] += @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] ||= []
      flash.now[:errors] += @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    Sub.destroy(params[:id])
    redirect_to subs_url
  end

  def require_moderator
    @sub = Sub.includes(:moderator).find(params[:id])
    unless @sub.moderator == current_user
      flash[:errors] ||= []
      flash[:errors] << "Must be moderator to edit sub"
      redirect_to sub_url(@sub)
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
