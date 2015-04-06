require 'rails_helper'
require 'spec_helper'

=begin
	Sets all unit tests for the model Team
=end
RSpec.describe Team, :type => :model do
	before do
		User.destroy_all

		User.create( :name_user => "USER_1", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "PLACE_1", 
			:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
	end

	subject( :team_valid ) {
		team = Team.new( :workplace => "PLACE_1" )
	}

	subject( :team_invalid ) {
		team = Team.new( :workplace => "PLACE_2" )
	}

	# All tests in this block are related to the method search_by_workplace.
	describe "#search_by_workplace" do

		it "when there are no members matching the search" do
			is_members_empty = team_invalid.search_by_workplace.empty?

			expect(is_members_empty).to be_truthy
		end

		it "when there are members matching the search" do
			members = team_valid.search_by_workplace.at( 0 )
			expected = User.where( :cost_center => "PLACE_1").at( 0 )

			expect(members).to eq(expected)
		end
	end

	# All tests in this block are related to the method list_name_members.
	describe "#list_name_members" do

		it "returns an ordered list name of team members" do
			list_name = Team.last.list_name_members

			expected = []
			expected << User.last.name_user

			expect(list_name).to eq(expected.sort)
		end
	end

	after( :all ) do
		User.destroy_all
	end
end
