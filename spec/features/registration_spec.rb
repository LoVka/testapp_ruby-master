require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  let(:new_user) { User.find_by(email: 'test@example.com') }

  specify 'user registers new account' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    fill_in 'Full name', with: 'Test User'
    fill_in 'Address', with: 'Kyiv'
    fill_in 'Age', with: '30'
    click_button 'Sign up'
    expect(page).to have_content I18n.t('devise.registrations.signed_up_but_unconfirmed')
    m = /href="([^"]+)"/.match(ActionMailer::Base.deliveries.last.body.to_s)
    visit m[1]
    expect(page).to have_content I18n.t('devise.confirmations.confirmed')
    expect(new_user).to be_confirmed
    expect(new_user).not_to be_approved
  end
end
