class PostsController < ApplicationController
  load_and_authorize_resource

  respond_to :html
  respond_to :js, :only => :index

  def index
    @posts = Post
      .with_tags(params[:tags])
      .order_by_created_at(params[:order])
      .containing_text(params[:search])
      .with_category_id(params[:category])

    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    respond_with(@post)
  end

  def edit
  end

  def create
    if @post.save
      flash[:success] = 'Post was created successfully!'
    else
      flash[:error]   = 'There is an error while creating a new post!'
    end

    respond_with(@post, :location => posts_url)
  end

  def update
    if @post.update_attributes(params[:post])
      flash[:success] = 'Post was successfully updated!'
    else
      flash[:error]   = 'There is an error while updating the post!'
    end

    respond_with(@post, :location => @post)
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post was successfully deleted!'

    redirect_to posts_url
  end

  def tags
    @tags = ActsAsTaggableOn::Tag.where("tags.name LIKE ?", "%#{params[:q]}%") 
    respond_to do |format|
      format.json { render :json => @tags.map{|t| {:id => t.name, :name => t.name }}}
    end
  end
end
