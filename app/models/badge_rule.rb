class BadgeRule < ApplicationRecord
  has_many :badge

  validates :name, presence: true, uniqueness: true

  enum kind: {
    specific_test: 0,
    all_tests_in_category: 1,
    all_tests_in_level: 2,
    first_try: 3
  }
end
