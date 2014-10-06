require "rails_helper"

RSpec.describe CompetencesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/competences").to route_to("competences#index")
    end

    it "routes to #new" do
      expect(:get => "/competences/new").to route_to("competences#new")
    end

    it "routes to #show" do
      expect(:get => "/competences/1").to route_to("competences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/competences/1/edit").to route_to("competences#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/competences").to route_to("competences#create")
    end

    it "routes to #update" do
      expect(:put => "/competences/1").to route_to("competences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/competences/1").to route_to("competences#destroy", :id => "1")
    end

  end
end
