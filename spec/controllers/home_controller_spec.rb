require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    let!(:category) { create(:category) }

    it "assigns all categories as @categories" do
      get :index, params: {}
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe "GET #category" do
    let(:category) { create(:category) }

    it "assigns the requested post as @post" do
      get :category, params: {category: category.slug}
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "GET #post" do
    let(:post) { create(:post) }

    it "assigns a new post as @post" do
      get :post, params: {category: post.category.slug, id: post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end
end
