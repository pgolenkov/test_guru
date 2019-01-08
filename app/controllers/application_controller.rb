class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound do |e|
    rescue_with_not_found(e)
  end

  before_action :set_locale
  before_action :authenticate_user!

  def default_url_options
    I18n.locale == I18n.default_locale ? super : { lang: I18n.locale }
  end

  private

  def rescue_with_not_found(e)
    render plain: e.message, status: :not_found
  end

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_tests_path : super
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
