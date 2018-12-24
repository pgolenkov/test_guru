class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:previous_path) || root_path, notice: 'Вход успешно выполнен'
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
