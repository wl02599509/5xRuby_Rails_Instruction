class SessionsController < ApplicationController
  def create
    user = User.login(params[:user])
    
    if user
      #發號碼牌 發 session
      session[:user_session] = user.id

      redirect_to '/', notice: '登入成功！'
    else
      redirect_to '/users/sign_in', notice: '登入失敗！'
    end
  end
end
