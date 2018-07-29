class User < ApplicationRecord
  include AASM
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  default_scope { where("aasm_state != 'banned'") }

  has_many :posts

  validates :full_name, presence: true
  validates :address, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
  # validates :role, presence: true

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
