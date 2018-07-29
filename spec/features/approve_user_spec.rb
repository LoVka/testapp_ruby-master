require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  context 'not confirmed' do
    let!(:user) { create(:user, approved: false) }

    specify 'user cannot login' do
      login_admin
      click_link 'Users'
      find_link('Edit', href: edit_user_path(user)).click
      check 'Approved'
      click_button 'Update User'
      expect(page).to have_content 'User was successfully updated.'
      user.reload
      expect(user).to be_approved
    end
  end
end
