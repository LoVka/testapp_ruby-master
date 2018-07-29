require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Post, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:category_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:body).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:lead).of_type(:text).with_options(null: false) }

    it { is_expected.to have_db_index(:category_id) }
    it { is_expected.to have_db_index(:user_id) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_and_belong_to_many(:editorial_lists) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:lead) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:lead).is_at_least(15).is_at_most(1000) }
  end
end
