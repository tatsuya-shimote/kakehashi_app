class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update]
  def index
    #@users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    if logged_in?
      redirect_to groups_path
    else
      @user = User.new
    end
  end
  
  def create
    @user = User.new(user_params)    
    if @user.save
      log_in(@user)
      flash[:success] = "登録に成功しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "登録に失敗しました。"
      render :new
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @user.update(user_edit_params)
      redirect_to @user
    else
      flash.now[:danger] = "保存に失敗しました。"
      render :edit
    end
  end
  
  # def delete
  # end


  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def user_edit_params
    params.require(:user).permit(:name, :content)
  end  
end
