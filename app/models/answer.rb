class Answer < ApplicationRecord
  MAX_COUNT = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_count_in_one_question, if: :question, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_in_one_question
    count_in_question_current = (question.answers.reload + [self]).uniq.size
    errors.add(:base, :invalid_count_in_one_answer) if count_in_question_current > MAX_COUNT
  end
end
