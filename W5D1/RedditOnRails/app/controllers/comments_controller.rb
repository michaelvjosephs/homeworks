class CommentsController < ApplicationController
  def new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] ||= []
      flash.now[:errors] += @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
