class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :test

  validates :body, presence: true

  def number
    test.questions.ids.sort.index(id) + 1
  end
end
