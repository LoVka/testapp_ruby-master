module ControllerMacros
  def login_user(opts = {})
    let(:current_user) { create(:user, opts) }
    before(:each) do
      sign_in current_user
    end
  end
end
