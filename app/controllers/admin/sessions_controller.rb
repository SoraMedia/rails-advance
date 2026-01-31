class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = AdminUser.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:admin_user_id] = user.id
      redirect_to admin_events_path, notice: "ログインしました"
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが違います"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to new_admin_session_path, notice: "ログアウトしました"
  end
end
