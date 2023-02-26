class CommentsController < ApplicationController
  before_action :get_post, only: :create
  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    end
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
end
