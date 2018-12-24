class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound do |e|
    rescue_with_not_found(e)
  end

  before_action :authenticate_user!

  private

  def rescue_with_not_found(e)
    render plain: e.message, status: :not_found
  end

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_tests_path : super
  end
end
