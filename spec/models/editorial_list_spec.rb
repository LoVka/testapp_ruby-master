require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe EditorialList do
  describe 'Database' do
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:about).of_type(:text) }
    it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }

    it { is_expected.to have_db_index(:slug).unique(true) }
  end

  describe 'Associations' do
    it { is_expected.to have_and_belong_to_many(:posts) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:slug) }

    describe 'uniqueness of slug' do
      subject { EditorialList.new(title: 'Editorial List 1') }

      it { is_expected.to validate_uniqueness_of(:slug) }
    end
  end
end
