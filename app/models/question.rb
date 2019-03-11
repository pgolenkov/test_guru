class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :test
  has_many :gists, dependent: :destroy

  validates :body, presence: true

  def number
    test.questions.order(:id).ids.index(id) + 1
  end
end
