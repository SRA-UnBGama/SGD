require 'rails_helper'
require 'spec_helper'

RSpec.describe AutoEvaluationsController, :type => :controller do
	login_admin

	let( :valid_attributes ) {
        {
            :observations_evaluated => "observação 1"
        }
    }

    let(:valid_session) { 
    	{
    		# Nothing
    	} 
    }

    subject( :evaluation ) {
    	Evaluation.new( valid_attributes )
    }

	describe "GET #index" do
		before do
            Evaluation.destroy_all
        end

		it "renders the :index view" do
			get :index

			expect( response ).to render_template( :index )
		end
	end

	describe "PUT #update" do
        before do
            Evaluation.destroy_all
        end

        context "with valid params" do
            let( :new_attributes ) {
                {
                    :observations_evaluated => "observação 2"
                }
            }

            it "updates the requested evaluation" do
                evaluation.save

                put :update, { :id => evaluation.to_param, :evaluation => new_attributes }, valid_session
                evaluation.reload

                expect( assigns(:evaluation ) ).to eq( evaluation )
            end

            it "assigns the requested evaluation as @evaluation" do
                evaluation.save

                put :update, { :id => evaluation.to_param, :evaluation => valid_attributes }, valid_session

                expect( assigns( :evaluation ) ).to eq( evaluation )
            end

            it "redirects to the auto_evaluation" do
                skip("Do test that assesses whether the redirection occurred correctly between the pages")
            end
        end
    end
end
