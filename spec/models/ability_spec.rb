require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability do
  subject { Ability.new(user) }

  context 'Public' do
    let(:user) { nil }

    it { is_expected.not_to be_able_to :manage, Post }
  end

  context 'User' do
    let(:user) { create(:user, role: User::USER) }
    let!(:own_post) { create(:post, user: user) }
    let!(:other_user_post) { create(:post) }

    it { is_expected.to be_able_to :manage, Post }
    it { is_expected.to be_able_to :manage, own_post }
    it { is_expected.not_to be_able_to :manage, other_user_post }
    it { expect(Post.accessible_by(subject)).to eq([own_post]) }
  end

  context 'Manager' do
    let(:user) { create(:user, role: User::MANAGER) }

    it { is_expected.to be_able_to :manage, EditorialList }
    it { is_expected.to be_able_to :manage, Category }
    it { is_expected.to be_able_to :manage, Post }
  end

  context 'Admin' do
    let(:user) { create(:user, role: User::ADMIN) }

    it { is_expected.to be_able_to :manage, :all }
  end
end
