require 'rails_helper'

RSpec.describe "teams/new", :type => :view do
  before(:each) do
    assign(:team, Team.new(
      :leader => "MyString",
      :members => "MyString",
      :workplace => "MyString"
    ))
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", teams_path, "post" do

      assert_select "input#team_leader[name=?]", "team[leader]"

      assert_select "input#team_members[name=?]", "team[members]"

      assert_select "input#team_workplace[name=?]", "team[workplace]"
    end
  end
end
