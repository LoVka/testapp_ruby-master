require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe User, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:full_name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:role).of_type(:string).with_options(default: 'User', null: false) }
    it { is_expected.to have_db_column(:address).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:age).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:approved).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:banned).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }

    it { is_expected.to have_db_index(:email).unique(true) }
    it { is_expected.to have_db_index(:reset_password_token).unique(true) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:posts) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_numericality_of(:age).is_greater_than_or_equal_to(18) }
    it { is_expected.to validate_presence_of(:email) }

    describe 'uniqueness of email' do
      subject { User.new(password: 'secret1234', role: 'user', full_name: 'User', address: 'Address', age: 24) }

      it { is_expected.to validate_uniqueness_of(:email) }
    end
  end

  describe '#state' do
    it { expect(build(:user, banned: true).state).to eq('banned') }
    it { expect(build(:user).state).to eq('approved') }
    it { expect(build(:user, approved: false).state).to eq('confirmed') }
    it { expect(build(:user, approved: false, confirmed_at: nil).state).to eq('new') }
  end
end
