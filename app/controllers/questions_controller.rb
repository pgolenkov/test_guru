class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound do |e|
    rescue_with_not_found(e)
  end

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
    @question = @test.questions.build
  end

  def edit
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      flash[:success] = "Вопрос успешно создан!"
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      flash[:success] = "Вопрос успешно обновлен!"
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = "Вопрос #{@question.body} был удалён"
    else
      flash[:error] = "Произошла ошибка при удалении вопроса #{@question.body}"
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
