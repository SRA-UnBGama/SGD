require 'rails_helper'

RSpec.describe "learning_solutions/index", :type => :view do
  before(:each) do
    assign(:learning_solutions, [
      LearningSolution.create!(
        :description => "Description",
        :category => "Category"
      ),
      LearningSolution.create!(
        :description => "Description",
        :category => "Category"
      )
    ])
  end

  it "renders a list of learning_solutions" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
