class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
   @group = current_user.group.find_by(id: params[:id])
   @post = current_user.posts.build(post_params)
   if @post.save
    redirect_to members_group_path(@group)
   else
     @posts = @group.posts
     render 'groups/members'
   end
  end
  
  def delete
    
  end
  
  private
  
  def post_params
    params.require(:post).permit(:message, :group_id)
  end
  
end
