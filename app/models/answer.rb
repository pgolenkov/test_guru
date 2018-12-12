class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_in_one_question, if: :question

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_in_one_question
    return unless question_id_changed?

    unless new_record?
      count_in_question_was = Answer.where(question_id: question_id_was).size
      errors.add(:base, :cannot_take_last_answer) if count_in_question_was == 1
    end

    count_in_question_current = (question.answers.reload + [self]).uniq.size
    errors.add(:base, :invalid_count_in_one_answer) unless (1..4).include?(count_in_question_current)
  end
end
