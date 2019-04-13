class Badge < ApplicationRecord
  has_one :badge_rule, dependent: :destroy
  has_many :user_badges, dependent: :destroy

  validates :name, :image, presence: true
end
