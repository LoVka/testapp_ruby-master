require "rails_helper"

RSpec.describe EditorialListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/editorial_lists").to route_to("editorial_lists#index")
    end

    it "routes to #new" do
      expect(:get => "/editorial_lists/new").to route_to("editorial_lists#new")
    end

    it "routes to #show" do
      expect(:get => "/editorial_lists/1").to route_to("editorial_lists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/editorial_lists/1/edit").to route_to("editorial_lists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/editorial_lists").to route_to("editorial_lists#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/editorial_lists/1").to route_to("editorial_lists#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/editorial_lists/1").to route_to("editorial_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/editorial_lists/1").to route_to("editorial_lists#destroy", :id => "1")
    end
  end
end
