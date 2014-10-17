require 'rails_helper'

RSpec.describe "auto_evaluations/show", :type => :view do
  before(:each) do
    @auto_evaluation = assign(:auto_evaluation, AutoEvaluation.create!(
      :grade_evaluation => "Grade Evaluation"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Grade Evaluation/)
  end
end
