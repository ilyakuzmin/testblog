class CommentsController < ApplicationController
  authorize_resource

  respond_to :html

  def index
    @comments = Comment.unverified
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])

    if @comment.save
      flash[:success] = 'Comment was created successfully!'
    else
      flash[:error]   = 'There is an error while creating a new comment!'
    end

    respond_with(@comment, :location => post_path(@post))
  end

  def destroy
    @post = Post.find(params[:post_id]) if params[:post_id]
    @comment = Comment.find(params[:id])

    @comment.destroy
    flash[:success] = 'Comment was successfully deleted!'

    redirect_to @post ? post_path(@post) : comments_path
  end

  def state
    @post = Post.find(params[:post_id]) if params[:post_id]
    @comment = Comment.find(params[:id])
    @comment.change_state(params[:change_to])

    redirect_to @post ? post_path(@post) : comments_path
  end

end
