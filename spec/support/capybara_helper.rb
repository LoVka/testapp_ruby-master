module CapybaraHelper
  def login_user(opts = {})
    user = create(:user, opts)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def login_admin(opts = {})
    login_user({role: User::ADMIN}.merge(opts))
  end

  def login_manager(opts = {})
    login_user({role: User::MANAGER}.merge(opts))
  end
end
