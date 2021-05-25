class PostsController < ApplicationController
  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to members_user_path
  end
  
  def delete
    @post = Post.find(params[:id])
    @post.destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:user_id, :group_id, :message)
  end
end
