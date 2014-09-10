require 'rails_helper'

RSpec.describe "evaluation_periods/index", :type => :view do
  before(:each) do
    assign(:evaluation_periods, [
      EvaluationPeriod.create!(),
      EvaluationPeriod.create!()
    ])
  end

  it "renders a list of evaluation_periods" do
    render
  end
end
