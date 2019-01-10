class Admin::AnswersController < Admin::ApplicationController
  before_action :find_question, only: [:new, :create]
  before_action :find_answer, only: [:edit, :update, :destroy]

  def new
    @answer = @question.answers.build
  end

  def edit
  end

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to [:admin, @question], notice: t(".success", body: @answer.body)
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to [:admin, @answer.question], notice: t(".success")
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to [:admin, @answer.question], notice: t(".success", body: @answer.body)
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
