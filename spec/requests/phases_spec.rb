require 'rails_helper'

RSpec.describe "Phases", :type => :request do
  describe "GET /phases" do
    it "works! (now write some real specs)" do
      get phases_path
      expect(response.status).to be(200)
    end
  end
end
