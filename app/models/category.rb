class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true
  validates :slug, :position, presence: true, uniqueness: true

  alias_attribute :order, :position # TODO: Remove
end
