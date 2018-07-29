require 'rails_helper'
require 'shoulda/matchers'

EditorialListsPost = Class.new(ApplicationRecord)
RSpec.describe EditorialListsPost, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:editorial_list_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:post_id).of_type(:integer).with_options(null: false) }

    it { is_expected.to have_db_index(:editorial_list_id) }
    it { is_expected.to have_db_index(:post_id) }
    it { is_expected.to have_db_index([:editorial_list_id, :post_id]).unique(true) }
  end
end
