require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:category) { create(:category) }
  let(:valid_attributes) {
    {category_id: category.id, title: 'My Post', body: 'Post content', lead: 'Lead of the post'}
  }
  let(:invalid_attributes) { {title: 'Incomplete Post', lead: 'To short'} }
  login_user

  describe "GET #index" do
    let!(:post) { create(:post, user: current_user) }

    it "assigns user's posts as @posts" do
      get :index, params: {}
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #show" do
    let(:post) { create(:post, user: current_user) }

    it "assigns the requested post as @post" do
      get :show, params: {id: post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new, params: {}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    let(:post) { create(:post, user: current_user) }

    it "assigns the requested post as @post" do
      get :edit, params: {id: post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {post: valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, params: {post: valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, params: {post: valid_attributes}
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, params: {post: invalid_attributes}
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        post :create, params: {post: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:post) { create(:post, user: current_user) }

    context "with valid params" do
      let(:new_attributes) { {title: 'New Title'} }

      it "updates the requested post" do
        put :update, params: {id: post.to_param, post: new_attributes}
        post.reload
        expect(post.title).to eq('New Title')
      end

      it "assigns the requested post as @post" do
        put :update, params: {id: post.to_param, post: valid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        put :update, params: {id: post.to_param, post: valid_attributes}
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "assigns the post as @post" do
        put :update, params: {id: post.to_param, post: invalid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: post.to_param, post: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:post) { create(:post, user: current_user) }

    it "destroys the requested post" do
      expect {
        delete :destroy, params: {id: post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete :destroy, params: {id: post.to_param}
      expect(response).to redirect_to(posts_url)
    end
  end
end
