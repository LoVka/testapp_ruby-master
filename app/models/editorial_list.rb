class EditorialList < ApplicationRecord
  has_and_belongs_to_many :posts

  validates_presence_of :title, :about, :slug
  validates_uniqueness_of :slug, if: :slug?
end
