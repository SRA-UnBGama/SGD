require 'rails_helper'

RSpec.describe PhasesController, :type => :controller do
  login_admin
  
    let( :valid_attributes_phase ) {
        {
            :start_date_phase => "01/01/2014",
            :end_date_phase => "30/01/2014"
        }
    }

    let( :invalid_attributes_phase ) {
        {
            :start_date_phase => "13/02/2014",
            :end_date_phase => "12/02/2014"
        }
    }

    let( :valid_attributes_period ) {
        {
            :start_date_evaluation => "01/01/2014",
            :end_date_evaluation => "30/12/2014"
        }
    }

    let( :valid_session ) { 
        {
            # Nothing
        } 
    }

    subject( :phase ) {
        Phase.new( valid_attributes_phase )
    }

    subject( :phases ) {
        Phase.all
    }

    before do
        Phase.destroy_all
        EvaluationPeriod.destroy_all

        period = EvaluationPeriod.create( valid_attributes_period )
        period.phases << phase
    end

    describe "PUT #update" do

        context "with valid params" do
            let( :new_attributes_phase ) {
                {
                    :start_date_phase => "05/01/2014",
                    :end_date_phase => "30/01/2014"
                }
            }

            it "updates the requested phase" do
                phase.save

                put :update, { :id => phase.to_param, :phase => new_attributes_phase }, valid_session
                phase.reload

                expect( assigns(:phase ) ).to eq( phase )
            end

            it "assigns the requested phase as @phase" do
                phase.save

                put :update, { :id => phase.to_param, :phase => valid_attributes_phase }, valid_session

                expect( assigns( :phase ) ).to eq( phase )
            end

            it "redirects to the phase" do
                phase.save

                put :update, { :id => phase.to_param, :phase => valid_attributes_phase }, valid_session

                expect( response ).to redirect_to( phase.evaluation_period )
            end
        end
    end
end
