class SubCategory < ApplicationRecord
  belongs_to :category
  paginates_per 5
  validates :description, presence: true
  validates :category, presence: true
end
