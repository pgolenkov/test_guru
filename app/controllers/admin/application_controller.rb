class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin'

  private

  def authenticate_admin!
    unless current_user.admin?
      redirect_to root_path, alert: 'У вас нет прав для посещения данной страницы'
    end
  end
end
