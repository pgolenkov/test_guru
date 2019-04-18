class Badge < ApplicationRecord
  belongs_to :badge_rule
  has_many :user_badges, dependent: :destroy

  validates :name, :image, presence: true
end
