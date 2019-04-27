class Badge < ApplicationRecord
  belongs_to :rule, class_name: 'BadgeRule'
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image, presence: true

  before_destroy :check_user_badges

  private

  def check_user_badges
    return true if self.user_badges.empty?

    errors.add :base, :user_badges_exist
    throw :abort
  end
end
