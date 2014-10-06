require 'rails_helper'

RSpec.describe "Competences", :type => :request do
  describe "GET /competences" do
    it "works! (now write some real specs)" do
      get competences_path
      expect(response).to have_http_status(200)
    end
  end
end
