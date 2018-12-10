class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  belongs_to :category
  belongs_to :owner, class_name: 'User', optional: true

  def self.titles_by_category(title)
    joins(:category).where(categories: { title: title })
      .order(title: :desc).pluck(:title)
  end
end
