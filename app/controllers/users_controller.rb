class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    
    if @user.save
      flash[:success] = "登録に成功しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "登録に失敗しました。"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def delete
  end


  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
end
