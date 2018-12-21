class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to tests_path, notice: 'Регистрация прошла успешно!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
