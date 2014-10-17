require 'rails_helper'

RSpec.describe "auto_evaluations/index", :type => :view do
  before(:each) do
    assign(:auto_evaluations, [
      AutoEvaluation.create!(
        :grade_evaluation => "Grade Evaluation"
      ),
      AutoEvaluation.create!(
        :grade_evaluation => "Grade Evaluation"
      )
    ])
  end

  it "renders a list of auto_evaluations" do
    render
    assert_select "tr>td", :text => "Grade Evaluation".to_s, :count => 2
  end
end
