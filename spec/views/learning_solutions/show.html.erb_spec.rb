require 'rails_helper'

RSpec.describe "learning_solutions/show", :type => :view do
  before(:each) do
    @learning_solution = assign(:learning_solution, LearningSolution.create!(
      :description => "Description",
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Category/)
  end
end
