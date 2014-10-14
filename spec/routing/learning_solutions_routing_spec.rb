require "rails_helper"

RSpec.describe LearningSolutionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/learning_solutions").to route_to("learning_solutions#index")
    end

    it "routes to #new" do
      expect(:get => "/learning_solutions/new").to route_to("learning_solutions#new")
    end

    it "routes to #show" do
      expect(:get => "/learning_solutions/1").to route_to("learning_solutions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/learning_solutions/1/edit").to route_to("learning_solutions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/learning_solutions").to route_to("learning_solutions#create")
    end

    it "routes to #update" do
      expect(:put => "/learning_solutions/1").to route_to("learning_solutions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/learning_solutions/1").to route_to("learning_solutions#destroy", :id => "1")
    end

  end
end
