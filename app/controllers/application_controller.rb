class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_fund

  helper_method :current_user, :user_sign_in?
  # 讓 view 也可以用

  private

	def not_fund
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def current_user
    @_user ||= User.find_by(id: session[:user_session])
  end

  def user_sign_in?
    session[:user_session] && current_user
  end

  def require_login
    redirect_to sign_in_users_path if !user_sign_in?
  end
end
