require 'rails_helper'

RSpec.describe "EvaluationItems", :type => :request do
  describe "GET /evaluation_items" do
    it "works! (now write some real specs)" do
      get evaluation_items_path
      expect(response).to have_http_status(200)
    end
  end
end
