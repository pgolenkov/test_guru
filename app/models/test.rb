class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  belongs_to :category
  belongs_to :owner, class_name: 'User', optional: true

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :by_level, -> (level) { where(level: level) }

  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5...Float::INFINITY) }

  scope :by_category, -> (title) {
    joins(:category).where(categories: { title: title })
  }

  def self.titles_by_category(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
end
