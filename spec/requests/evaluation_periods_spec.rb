require 'rails_helper'

RSpec.describe "EvaluationPeriods", :type => :request do
  describe "GET /evaluation_periods" do
    it "works! (now write some real specs)" do
      get evaluation_periods_path
      expect(response.status).to be(200)
    end
  end
end
