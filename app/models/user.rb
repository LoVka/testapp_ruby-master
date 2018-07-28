class User < ApplicationRecord
  include AASM

  default_scope { where("aasm_state != 'banned'") }

  validates :email, uniqueness: true, format: { with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i }
  validates :password, presence: true
  validates :full_name, presence: true
  validates :address, presence: true
  validates :age, presence: true, numericality: { :greater_than => 18 }

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

  def self.authenticate(email, password)
    user = find_by_email(email)
    user && user.password == password ? user : nil
  end
end
