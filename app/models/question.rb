class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :test

  validates :body, presence: true
  validate :validate_answers_count, unless: :new_record?

  private

  def validate_answers_count
    errors.add(:answers, :in_range_one_to_four) unless (1..4).include?(answers.count)
  end
end
