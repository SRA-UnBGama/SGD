require "rails_helper"

RSpec.describe PhasesController, :type => :routing do
  describe "routing" do

    it "routes to #edit" do
      expect(:get => "/phases/1/edit").to route_to("phases#edit", :id => "1")
    end

    it "routes to #update" do
      expect(:put => "/phases/1").to route_to("phases#update", :id => "1")
    end
  end
end
