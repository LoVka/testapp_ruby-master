require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  context 'not confirmed' do
    let(:user) { create(:user, confirmed_at: nil, approved: true) }

    specify 'user cannot login' do
      visit '/'
      click_link 'Login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content I18n.t('devise.failure.unconfirmed')
    end
  end

  context 'not approved' do
    let(:user) { create(:user, approved: false) }

    specify 'user cannot login' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content I18n.t('devise.failure.not_approved')
    end
  end

  context 'banned' do
    let(:user) { create(:user, approved: true, banned: true) }

    specify 'user cannot login' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content I18n.t('devise.failure.banned')
    end
  end

  context 'confirmed and approved' do
    let(:user) { create(:user) }

    specify 'user successfully login' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content I18n.t('devise.sessions.signed_in')
    end
  end
end
