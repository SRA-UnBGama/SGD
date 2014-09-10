require 'rails_helper'

RSpec.describe "evaluation_periods/edit", :type => :view do
  before(:each) do
    @evaluation_period = assign(:evaluation_period, EvaluationPeriod.create!())
  end

  it "renders the edit evaluation_period form" do
    render

    assert_select "form[action=?][method=?]", evaluation_period_path(@evaluation_period), "post" do
    end
  end
end
