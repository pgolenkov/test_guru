class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :test
end
