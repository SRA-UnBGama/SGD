require 'rails_helper'

RSpec.describe "evaluation_periods/show", :type => :view do
  before(:each) do
    @evaluation_period = assign(:evaluation_period, EvaluationPeriod.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
