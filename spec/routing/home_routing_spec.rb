require "rails_helper"

RSpec.describe HomeController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/").to route_to("home#index")
    end

    it "routes to #category" do
      expect(:get => "/my-category/").to route_to("home#category", category: 'my-category')
    end

    it "routes to #post" do
      expect(:get => "/my-category/1").to route_to("home#post", category: 'my-category', id: '1')
    end
  end
end
