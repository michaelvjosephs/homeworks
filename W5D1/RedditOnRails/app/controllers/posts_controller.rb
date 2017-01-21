class PostsController < ApplicationController
  before_action :require_logged_in
  before_action :require_author, only: [:edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @all_subs = Sub.all
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] ||= []
      flash.now[:errors] += @post.errors.full_messages
      @all_subs = Sub.all
      render :new
    end
  end

  def edit
    @all_subs = Sub.all
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    @post.author = current_user
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] ||= []
      flash.now[:errors] += @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to root_url
  end

  def require_author
    @post = Post.find(params[:id])
    unless @post.author == current_user
      flash[:errors] ||= []
      flash[:errors] << "Must be author to edit or delete post"
      redirect_to post_url(@post)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
