class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answers?(answer_ids)
      self.correct_questions += 1
    end
    self.current_question = next_question
    save!
  end

  private

  def before_validation_set_current_question
    self.current_question = test.questions.first
  end

  def correct_answers?(answer_ids)
    current_question.answers.correct.ids.sort == answer_ids.sort
  end

  def next_question
    test.questions.where('id > ?', current_question_id).order(:id).first
  end
end
