require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:invalid_attributes) { {age: 12} }
  login_user(role: User::ADMIN)

  describe "GET #index" do
    let!(:user) { create(:user) }

    it "assigns all users as @users" do
      get :index, params: {}
      expect(assigns(:users)).to eq([current_user, user])
    end
  end

  describe "GET #show" do
    let(:user) { create(:user) }

    it "assigns the requested user as @user" do
      get :show, params: {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #edit" do
    let(:user) { create(:user) }

    it "assigns the requested user as @user" do
      get :edit, params: {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "PUT #update" do
    let(:user) { create(:user) }

    context "with valid params" do
      let(:new_attributes) { {age: 30} }

      it "updates the requested user" do
        put :update, params: {id: user.to_param, user: new_attributes}
        user.reload
        expect(user.age).to eq(30)
      end

      it "assigns the requested user as @user" do
        put :update, params: {id: user.to_param, user: new_attributes}
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        put :update, params: {id: user.to_param, user: new_attributes}
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        put :update, params: {id: user.to_param, user: invalid_attributes}
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: user.to_param, user: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { create(:user) }

    it "destroys the requested user" do
      expect {
        delete :destroy, params: {id: user.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, params: {id: user.to_param}
      expect(response).to redirect_to(users_url)
    end
  end
end
