require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:valid_attributes) {
    {name: 'My Category', slug: 'my-category'}
  }
  let(:invalid_attributes) { {name: ''} }
  login_user(role: User::MANAGER)

  describe "GET #index" do
    let!(:category) { create(:category) }

    it "assigns all categories as @categories" do
      get :index, params: {}
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe "GET #show" do
    let(:category) { create(:category) }

    it "assigns the requested category as @category" do
      get :show, params: {id: category.to_param}
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "GET #new" do
    it "assigns a new category as @category" do
      get :new, params: {}
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe "GET #edit" do
    let(:category) { create(:category) }

    it "assigns the requested category as @category" do
      get :edit, params: {id: category.to_param}
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, params: {category: valid_attributes}
        }.to change(Category, :count).by(1)
      end

      it "assigns a newly created category as @category" do
        post :create, params: {category: valid_attributes}
        expect(assigns(:category)).to be_a(Category)
        expect(assigns(:category)).to be_persisted
      end

      it "redirects to the created category" do
        post :create, params: {category: valid_attributes}
        expect(response).to redirect_to(Category.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved category as @category" do
        post :create, params: {category: invalid_attributes}
        expect(assigns(:category)).to be_a_new(Category)
      end

      it "re-renders the 'new' template" do
        post :create, params: {category: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:category) { create(:category) }

    context "with valid params" do
      let(:new_attributes) { {name: 'New Name'} }

      it "updates the requested category" do
        put :update, params: {id: category.to_param, category: new_attributes}
        category.reload
        expect(category.name).to eq('New Name')
      end

      it "assigns the requested category as @category" do
        put :update, params: {id: category.to_param, category: valid_attributes}
        expect(assigns(:category)).to eq(category)
      end

      it "redirects to the category" do
        put :update, params: {id: category.to_param, category: valid_attributes}
        expect(response).to redirect_to(category)
      end
    end

    context "with invalid params" do
      it "assigns the category as @category" do
        put :update, params: {id: category.to_param, category: invalid_attributes}
        expect(assigns(:category)).to eq(category)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: category.to_param, category: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:category) { create(:category) }

    it "destroys the requested category" do
      expect {
        delete :destroy, params: {id: category.to_param}
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      delete :destroy, params: {id: category.to_param}
      expect(response).to redirect_to(categories_url)
    end
  end
end
