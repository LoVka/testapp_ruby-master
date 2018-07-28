class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true
  validates :order, :slug, uniqueness: true, presence: true
end
