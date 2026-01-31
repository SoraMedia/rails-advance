class ApplicationController < ActionController::Base
  helper_method :current_admin_user, :admin_logged_in?

  def current_admin_user
    return nil unless session[:admin_user_id]
    @current_admin_user ||= AdminUser.find_by(id: session[:admin_user_id])
  end

  def admin_logged_in?
    current_admin_user.present?
  end

  def require_admin_login
    return if admin_logged_in?
    redirect_to new_admin_session_path, alert: "ログインしてください"
  end
end

