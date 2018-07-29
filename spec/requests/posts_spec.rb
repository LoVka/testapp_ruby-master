require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "requires login" do
      get posts_path
      expect(response).to have_http_status(302)
    end
  end
end
