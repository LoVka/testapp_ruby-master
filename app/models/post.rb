class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_and_belongs_to_many :editorial_lists

  validates_presence_of :title, :lead, :body
  validates_length_of :lead, minimum: 15, maximum: 1000
end
