class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound do |e|
    rescue_with_not_found(e)
  end

  def index
    @questions = @test.questions
  end

  def show
    render plain: @question.body
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      flash[:success] = "Question #{@question.body} created"
    else
      flash[:error] = "Question create errors: #{@question.errors.full_messages.join(';')}"
    end
    redirect_to test_questions_path(@test)
  end

  def destroy
    if @question.destroy
      flash[:success] = "Question #{@question.body} destroyed"
    else
      flash[:error] = "Question #{@question.body} has not been destroyed"
    end
    redirect_to test_questions_path(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_not_found(e)
    render plain: e.message, status: :not_found
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
