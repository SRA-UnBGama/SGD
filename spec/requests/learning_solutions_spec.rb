require 'rails_helper'

RSpec.describe "LearningSolutions", :type => :request do
  describe "GET /learning_solutions" do
    it "works! (now write some real specs)" do
      get learning_solutions_path
      expect(response).to have_http_status(302)
    end
  end
end
