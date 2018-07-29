class User < ApplicationRecord
  include AASM
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  default_scope { where("aasm_state != 'banned'") }

  has_many :posts

  validates_presence_of :full_name,:address, :age, :role
  validates_numericality_of :age, greater_than_or_equal_to: 18

  aasm do
    state :new, initial: true
    state :approved
    state :banned

    event :approve do
      transitions from: :new, to: :approved
    end

    event :ban do
      transitions from: :approved, to: :banned
    end

    event :restore do
      transitions from: :banned, to: :approved
    end
  end

  def manager?
    role == 'manager'
  end

  def user?
    role == 'user'
  end

  def viewer?
    role == 'viewer'
  end
end
