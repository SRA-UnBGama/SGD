require 'rails_helper'

RSpec.describe "learning_solutions/new", :type => :view do
  before(:each) do
    assign(:learning_solution, LearningSolution.new(
      :description => "MyString",
      :category => "MyString"
    ))
  end

  it "renders new learning_solution form" do
    render

    assert_select "form[action=?][method=?]", learning_solutions_path, "post" do

      assert_select "input#learning_solution_description[name=?]", "learning_solution[description]"

      assert_select "input#learning_solution_category[name=?]", "learning_solution[category]"
    end
  end
end
