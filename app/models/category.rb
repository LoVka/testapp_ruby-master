class Category < ApplicationRecord
  has_many :posts

  validates_presence_of :name, :slug, :position
  validates_uniqueness_of :slug, if: :slug?
  validates_uniqueness_of :position #, if: :position?

  alias_attribute :order, :position # TODO: Remove
end
