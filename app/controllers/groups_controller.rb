class GroupsController < ApplicationController
   before_action :require_user_logged_in
  
  def index
    @groups = Group.order(id: :desc).page(params[:page]).per(6)
    #@groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      flash.now[:danger] = "作成に失敗しました。全ての項目に入力をしてください。"
      render new_group_path
    end
  end

  def destroy
  end
  
  private
  
  def group_params
    params.require(:group).permit(:limit, :learning, :content)
  end
end
