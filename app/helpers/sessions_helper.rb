module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
  
  #ユーザー詳細ページの編集機能を表示するかしないかに利用
  def current_user?
    current_user == User.find_by(id: params[:id])
  end
    
    
end
