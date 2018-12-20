class TestPassage < ApplicationRecord
  SUCCESS_LIMIT = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answers?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def success_percent
    (correct_questions.to_f / test.questions.count * 100).to_i
  end

  def success?
    success_percent >= SUCCESS_LIMIT
  end

  private

  def before_validation_set_current_question
    self.current_question = new_record? ? test.questions.first : next_question
  end

  def correct_answers?(answer_ids)
    current_question.answers.correct.order(:id).ids == answer_ids.sort
  end

  def next_question
    test.questions.where('id > ?', current_question_id).order(:id).first
  end
end
