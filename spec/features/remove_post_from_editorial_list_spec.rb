require 'rails_helper'

RSpec.describe 'Remove Post from Editorial List', type: :feature do
  let!(:post) { create(:post) }
  let!(:editorial_list) { create(:editorial_list, posts: [post]) }

  specify 'manager removes post from editorial list' do
    login_manager
    click_link 'Posts'
    find_link('Edit', href: edit_post_path(post)).click
    uncheck editorial_list.title
    click_button 'Update Post'
    expect(page).to have_content 'Post was successfully updated.'
    expect(post.editorial_lists).not_to include(editorial_list)
  end
end
