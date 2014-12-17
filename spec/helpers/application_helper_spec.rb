require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do

  describe '#resource_name' do

    it "return user resource name" do
      user = helper.resource_name.to_s
      expect(user).to eq("user")
    end

  end

  describe '#resource' do

    it "shoud return a user resource" do
      resource = helper.resource
      expect(resource).to be_a User
    end

  end

end
