class Admin::BadgesController < ApplicationController
  before_action :find_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to [:admin, @badge], notice: t(".success", title: @badge.name)
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], notice: t(".success")
    else
      render :edit
    end
  end

  def destroy
    if @badge.destroy
      redirect_to admin_badges_path, notice: t(".success", title: @badge.name)
    else
      redirect_to admin_badges_path, alert: t(".error", title: @badge.errors.messages.join)
    end
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image, :rule_id)
  end
end
