require 'rails_helper'

RSpec.describe EditorialListsController, type: :controller do
  let(:valid_attributes) {
    {title: 'My Editorial List', about: 'About My Editorial List', slug: 'my-editorial-list'}
  }
  let(:invalid_attributes) { {title: ''} }
  login_user(role: User::MANAGER)

  describe "GET #index" do
    let!(:editorial_list) { create(:editorial_list) }

    it "assigns all editorial_lists as @editorial_lists" do
      get :index, params: {}
      expect(assigns(:editorial_lists)).to eq([editorial_list])
    end
  end

  describe "GET #show" do
    let(:editorial_list) { create(:editorial_list) }

    it "assigns the requested editorial_list as @editorial_list" do
      get :show, params: {id: editorial_list.to_param}
      expect(assigns(:editorial_list)).to eq(editorial_list)
    end
  end

  describe "GET #new" do
    it "assigns a new editorial_list as @editorial_list" do
      get :new, params: {}
      expect(assigns(:editorial_list)).to be_a_new(EditorialList)
    end
  end

  describe "GET #edit" do
    let(:editorial_list) { create(:editorial_list) }

    it "assigns the requested editorial_list as @editorial_list" do
      get :edit, params: {id: editorial_list.to_param}
      expect(assigns(:editorial_list)).to eq(editorial_list)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new EditorialList" do
        expect {
          post :create, params: {editorial_list: valid_attributes}
        }.to change(EditorialList, :count).by(1)
      end

      it "assigns a newly created editorial_list as @editorial_list" do
        post :create, params: {editorial_list: valid_attributes}
        expect(assigns(:editorial_list)).to be_a(EditorialList)
        expect(assigns(:editorial_list)).to be_persisted
      end

      it "redirects to the created editorial_list" do
        post :create, params: {editorial_list: valid_attributes}
        expect(response).to redirect_to(EditorialList.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved editorial_list as @editorial_list" do
        post :create, params: {editorial_list: invalid_attributes}
        expect(assigns(:editorial_list)).to be_a_new(EditorialList)
      end

      it "re-renders the 'new' template" do
        post :create, params: {editorial_list: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:editorial_list) { create(:editorial_list) }

    context "with valid params" do
      let(:new_attributes) { {title: 'New Title'} }

      it "updates the requested editorial_list" do
        put :update, params: {id: editorial_list.to_param, editorial_list: new_attributes}
        editorial_list.reload
        expect(editorial_list.title).to eq('New Title')
      end

      it "assigns the requested editorial_list as @editorial_list" do
        put :update, params: {id: editorial_list.to_param, editorial_list: valid_attributes}
        expect(assigns(:editorial_list)).to eq(editorial_list)
      end

      it "redirects to the editorial_list" do
        put :update, params: {id: editorial_list.to_param, editorial_list: valid_attributes}
        expect(response).to redirect_to(editorial_list)
      end
    end

    context "with invalid params" do
      it "assigns the editorial_list as @editorial_list" do
        put :update, params: {id: editorial_list.to_param, editorial_list: invalid_attributes}
        expect(assigns(:editorial_list)).to eq(editorial_list)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: editorial_list.to_param, editorial_list: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:editorial_list) { create(:editorial_list) }

    it "destroys the requested editorial_list" do
      expect {
        delete :destroy, params: {id: editorial_list.to_param}
      }.to change(EditorialList, :count).by(-1)
    end

    it "redirects to the editorial_lists list" do
      delete :destroy, params: {id: editorial_list.to_param}
      expect(response).to redirect_to(editorial_lists_url)
    end
  end
end
