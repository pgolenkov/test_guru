class Category < ApplicationRecord
  has_many :tests, dependent: :destroy
end
