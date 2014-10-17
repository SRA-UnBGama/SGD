require 'rails_helper'

RSpec.describe "AutoEvaluations", :type => :request do
  describe "GET /auto_evaluations" do
    it "works! (now write some real specs)" do
      get auto_evaluations_path
      expect(response).to have_http_status(200)
    end
  end
end
