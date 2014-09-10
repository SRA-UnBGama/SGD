require "rails_helper"

RSpec.describe EvaluationPeriodsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/evaluation_periods").to route_to("evaluation_periods#index")
    end

    it "routes to #new" do
      expect(:get => "/evaluation_periods/new").to route_to("evaluation_periods#new")
    end

    it "routes to #show" do
      expect(:get => "/evaluation_periods/1").to route_to("evaluation_periods#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/evaluation_periods/1/edit").to route_to("evaluation_periods#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/evaluation_periods").to route_to("evaluation_periods#create")
    end

    it "routes to #update" do
      expect(:put => "/evaluation_periods/1").to route_to("evaluation_periods#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/evaluation_periods/1").to route_to("evaluation_periods#destroy", :id => "1")
    end

  end
end
