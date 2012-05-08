class CommentsController < ApplicationController
  authorize_resource

  respond_to :html

  def index
    @comments = Comment.unverified
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    @comment.user = current_user if user_signed_in?

    if verify_recaptcha_for_guest && @comment.save
      flash[:success] = 'Comment was created successfully!'
    else
      flash[:error]   = 'There is an error while creating a new comment!'
    end

    redirect_to post_path(@post)
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

  def verify_recaptcha_for_guest
    user_signed_in?? true : verify_recaptcha
  end

end
