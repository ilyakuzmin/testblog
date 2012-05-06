class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.all

    respond_with(@posts)
  end

  def show
    @post = Post.find(params[:id])

    respond_with(@post)
  end

  def new
    @post = Post.new

    respond_with(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = 'Post was created successfully!'
    else
      flash[:error]   = 'There is an error while creating a new post!'
    end

    respond_with(@post, :location => posts_url)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = 'Post was successfully updated!'
    else
      flash[:error]   = 'There is an error while updating the post!'
    end

    respond_with(@post, :location => @post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post was successfully deleted!'

    redirect_to posts_url
  end
end
