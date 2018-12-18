class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: [:show, :result, :update]

  def show
  end

  def result
    @success_percent = @test_passage.success_percent
  end

  def update
    @test_passage.accept!(params[:answer_ids].to_a.map(&:to_i))
    if @test_passage.completed?
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
