class BadgesController < ApplicationController
  def index
    @badges = current_user.badges.uniq
    @user_badges = current_user.user_badges
  end
end
