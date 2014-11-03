require 'rails_helper'

RSpec.describe "teams/show", :type => :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      :leader => "Leader",
      :members => "Members",
      :workplace => "Workplace"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Leader/)
    expect(rendered).to match(/Members/)
    expect(rendered).to match(/Workplace/)
  end
end
