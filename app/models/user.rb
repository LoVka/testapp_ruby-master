class User < ApplicationRecord
  ADMIN = 'Admin'.freeze
  MANAGER = 'Manager'.freeze
  USER = 'User'.freeze
  ROLES = [ADMIN, MANAGER, USER].freeze
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  validates_presence_of :full_name, :address, :age
  validates_numericality_of :age, greater_than_or_equal_to: 18

  def state
    return 'banned' if banned?
    return 'approved' if approved?
    return 'confirmed' if confirmed?
    'new'
  end

  def active_for_authentication?
    super && !banned? && approved?
  end

  def inactive_message
    return :banned if confirmed? && banned?
    return :not_approved if confirmed? && !approved?
    super
  end
end
