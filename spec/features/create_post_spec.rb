require 'rails_helper'

RSpec.describe 'Create New Post', type: :feature do
  before { create(:category, name: 'News', slug: 'news') }
  let(:new_post) { Post.find_by(title: 'My Post') }

  specify 'user creates new post' do
    login_user
    click_link 'Posts'
    click_link 'New Post'
    fill_in 'Title', with: 'My Post'
    fill_in 'Lead', with: 'Lead of the post'
    fill_in 'Body', with: 'Post conntent'
    select 'News', from: 'Category'
    click_button 'Create Post'
    expect(page).to have_content 'Post was successfully created.'
    expect(new_post).to be_present
  end
end
