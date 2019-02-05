class Admin::GistsController < Admin::ApplicationController
  def index
    @gists = Gist.includes(:question, :user)
  end
end
