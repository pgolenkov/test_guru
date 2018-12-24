class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged_in?

  rescue_from ActiveRecord::RecordNotFound do |e|
    rescue_with_not_found(e)
  end

  before_action :authenticate_user!

  private

  def rescue_with_not_found(e)
    render plain: e.message, status: :not_found
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user!
    unless current_user
      cookies[:previous_path] = request.fullpath
      redirect_to login_path, alert: 'Необходимо произвести вход'
    end
  end
end
