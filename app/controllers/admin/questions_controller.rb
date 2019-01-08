class Admin::QuestionsController < Admin::ApplicationController
  before_action :find_test, only: [:new, :create]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

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
      redirect_to [:admin, @question], notice: t(".success", body: @question.body)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question], notice: t(".success")
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to [:admin, @question.test], notice: t(".success", body: @question.body)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
