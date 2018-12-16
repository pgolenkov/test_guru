class TestsController < ApplicationController
  def index
    @tests = Test.select(:id, :title, 'COUNT(test_id) as count').joins(:questions).group(:test_id)
  end

  def show
    @test = Test.find(params[:id])
    redirect_to test_questions_path(@test)
  end
end
