class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
   @post = current_user.posts.build(post_params)
   if @post.save
     redirect_to members_group_path
   else
     flash[:danger] = "送信失敗"
     redirect_to members_group_path
   end
  end
  
  def delete
    
  end
  
  private
  
  def post_params
    params.require(:post).permit(:message, :group_id)
  end
  
end
