require "rails_helper"

RSpec.describe RSSController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/rss/latest.xml").to route_to("rss#latest", format: 'xml')
    end

    it "routes to #category" do
      expect(:get => "/rss/category/my-category.xml").to route_to("rss#category", slug: 'my-category', format: 'xml')
    end

    it "routes to #post" do
      expect(:get => "/rss/editorial/my-category.xml").to route_to("rss#editorial", slug: 'my-category', format: 'xml')
    end
  end
end
