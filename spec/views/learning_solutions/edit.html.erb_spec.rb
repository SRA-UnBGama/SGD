require 'rails_helper'

RSpec.describe "learning_solutions/edit", :type => :view do
  before(:each) do
    @learning_solution = assign(:learning_solution, LearningSolution.create!(
      :description => "MyString",
      :category => "MyString"
    ))
  end

  it "renders the edit learning_solution form" do
    render

    assert_select "form[action=?][method=?]", learning_solution_path(@learning_solution), "post" do

      assert_select "input#learning_solution_description[name=?]", "learning_solution[description]"

      assert_select "input#learning_solution_category[name=?]", "learning_solution[category]"
    end
  end
end
