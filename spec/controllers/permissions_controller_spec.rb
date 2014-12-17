require 'rails_helper'
require 'spec_helper'

RSpec.describe PermissionsController, :type => :controller do
	login_admin

	let( :valid_attributes ) {
		{
			:name_user => "USER_1",
			:fub_registry => "123",
			:siape_registry => "123",
			:cost_center =>  "PLACE_1",
			:admission_date => "2015-03-10",
			:password => "123456",
			:password_confirmation => "123456",
			:is_active_user => true
		}
	}

	let(:valid_session) { 
		{
			# Nothing
		} 
	}

	before do
		User.destroy_all

		User.create( valid_attributes )
	end

	subject( :user ) {
		User.all
	}

	describe "GET #index" do

        it "assigns all users as @user" do
            skip()
        end
	end
end
