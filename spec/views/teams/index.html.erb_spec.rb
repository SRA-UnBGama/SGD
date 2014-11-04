require 'rails_helper'

RSpec.describe "teams/index", :type => :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
        :leader => "Leader",
        :members => "Members",
        :workplace => "Workplace"
      ),
      Team.create!(
        :leader => "Leader",
        :members => "Members",
        :workplace => "Workplace"
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", :text => "Leader".to_s, :count => 2
    assert_select "tr>td", :text => "Workplace".to_s, :count => 2
  end
end
