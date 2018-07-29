class Category < ApplicationRecord
  has_many :posts

  before_validation :set_position

  validates_presence_of :name, :slug
  validates_uniqueness_of :slug, if: :slug?
  validates_uniqueness_of :position

  private

  def set_position
    self.position ||= Category.maximum(:position).to_i + 1
  end
end
