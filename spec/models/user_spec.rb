require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe User do
  describe 'Database' do
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:password).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:full_name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:address).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:role).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:aasm_state).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:age).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:admin).of_type(:boolean).with_options(default: false, null: false) }

    it { is_expected.to have_db_index(:email).unique(true) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:posts) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_numericality_of(:age).is_greater_than_or_equal_to(18) }

    describe 'uniqueness of email' do
      subject { User.new(password: 'secret1234', role: 'user', full_name: 'User', address: 'Address', age: 24) }

      it { is_expected.to validate_uniqueness_of(:email) }
    end
  end
end
