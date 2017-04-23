class Category < ApplicationRecord
  validates :description, presence: true
  paginates_per 5

  has_many :sub_categories
end
