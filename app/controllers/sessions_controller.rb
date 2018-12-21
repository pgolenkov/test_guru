class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      path_to_redirect = cookies.delete(:previous_path)
      redirect_to path_to_redirect || root_path, notice: 'Вход успешно выполнен'
    else
      flash.now[:alert] = 'Неверные данные для входа'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Выход произведён успешно'
  end
end
