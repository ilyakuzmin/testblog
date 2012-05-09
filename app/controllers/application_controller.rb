class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def load_comments
    @post ||= Post.find(params[:post_id])
    if can? :change_state, Comment
      @comments = @post.comments
    else
      @comments = @post.comments.accepted_or_owner(current_user)
    end
  end
end
