require 'rails_helper'

RSpec.describe RSSController, type: :controller do
  describe "GET #latest" do
    let!(:post) { create(:post) }

    it "assigns all categories as @categories" do
      get :latest, format: 'xml'
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #category" do
    let(:category) { create(:category) }
    let!(:post) { create(:post, category: category) }
    before { create(:post) }

    it "assigns the requested category as @category and category's posts as @posts" do
      get :category, params: {slug: category.slug}, format: 'xml'
      expect(assigns(:category)).to eq(category)
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #editorial" do
    let(:post) { create(:post) }
    let(:editorial_list) { create(:editorial_list, posts: [post]) }
    before { create(:post) }

    it "assigns the requested list as @editorial_list and lists's posts as @posts" do
      get :editorial, params: {slug: editorial_list.slug}, format: 'xml'
      expect(assigns(:list)).to eq(editorial_list)
      expect(assigns(:posts)).to eq([post])
    end
  end
end
