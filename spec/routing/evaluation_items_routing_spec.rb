require "rails_helper"

RSpec.describe EvaluationItemsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/evaluation_items").to route_to("evaluation_items#index")
    end

    it "routes to #new" do
      expect(:get => "/evaluation_items/new").to route_to("evaluation_items#new")
    end

    it "routes to #show" do
      expect(:get => "/evaluation_items/1").to route_to("evaluation_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/evaluation_items/1/edit").to route_to("evaluation_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/evaluation_items").to route_to("evaluation_items#create")
    end

    it "routes to #update" do
      expect(:put => "/evaluation_items/1").to route_to("evaluation_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/evaluation_items/1").to route_to("evaluation_items#destroy", :id => "1")
    end

  end
end
