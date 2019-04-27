class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: [:show, :result, :gist, :update]

  def show
  end

  def result
    @gotten_badges = Badge.where(id: flash[:gotten_badge_ids])
    flash.delete(:gotten_badge_ids)
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    gist_url = result && result[:html_url]
    if gist_url.present?
      current_user.gists.create(question: @test_passage.current_question, url: gist_url)
      redirect_to @test_passage, notice: t(".success", url: gist_url)
    else
      redirect_to @test_passage, alert: t(".failure")
    end
  end

  def update
    @test_passage.accept!(params[:answer_ids].to_a.map(&:to_i))
    if @test_passage.completed?
      gotten_badges = BadgeCheckService.new(@test_passage).call
      current_user.badges.push(gotten_badges)
      flash[:gotten_badge_ids] = gotten_badges.map(&:id)
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
