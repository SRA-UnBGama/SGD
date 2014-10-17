require 'rails_helper'

RSpec.describe "auto_evaluations/edit", :type => :view do
  before(:each) do
    @auto_evaluation = assign(:auto_evaluation, AutoEvaluation.create!(
      :grade_evaluation => "MyString"
    ))
  end

  it "renders the edit auto_evaluation form" do
    render

    assert_select "form[action=?][method=?]", auto_evaluation_path(@auto_evaluation), "post" do

      assert_select "input#auto_evaluation_grade_evaluation[name=?]", "auto_evaluation[grade_evaluation]"
    end
  end
end
