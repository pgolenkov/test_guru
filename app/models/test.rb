class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :category
end
