require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Category do
  describe 'Database' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:position).of_type(:integer).with_options(null: false) }

    it { is_expected.to have_db_index(:slug).unique(true) }
    it { is_expected.to have_db_index(:position).unique(true) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:posts) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:slug) }

    context 'uniqueness' do
      subject { Category.new(name: 'Category', slug: 'category', position: 1) }

      it { is_expected.to validate_uniqueness_of(:slug) }
      it { is_expected.to validate_uniqueness_of(:position) }
    end
  end
end
