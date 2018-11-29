class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests

  def tests_by_level(level)
    tests.where(level: level)
  end
end
