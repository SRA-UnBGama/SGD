require 'rails_helper'

RSpec.describe "evaluation_periods/new", :type => :view do
  before(:each) do
    assign(:evaluation_period, EvaluationPeriod.new())
  end

  it "renders new evaluation_period form" do
    render

    assert_select "form[action=?][method=?]", evaluation_periods_path, "post" do
    end
  end
end
