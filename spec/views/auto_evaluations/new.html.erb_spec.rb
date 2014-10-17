require 'rails_helper'

RSpec.describe "auto_evaluations/new", :type => :view do
  before(:each) do
    assign(:auto_evaluation, AutoEvaluation.new(
      :grade_evaluation => "MyString"
    ))
  end

  it "renders new auto_evaluation form" do
    render

    assert_select "form[action=?][method=?]", auto_evaluations_path, "post" do

      assert_select "input#auto_evaluation_grade_evaluation[name=?]", "auto_evaluation[grade_evaluation]"
    end
  end
end
