class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_and_belongs_to_many :editorial_lists

  validates :title, :lead, :body, presence: true
  validates :lead, length: { minimum: 15, maximum: 1000 }
end
