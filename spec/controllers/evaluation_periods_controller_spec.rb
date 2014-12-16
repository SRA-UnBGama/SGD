require 'rails_helper'
require 'spec_helper'

RSpec.describe EvaluationPeriodsController, :type => :controller do
  login_admin

    let( :valid_attributes ) {
        {
            :start_date_evaluation => "01/01/2014",
            :end_date_evaluation => "30/12/2014",
            :created_at => "09/10/2014",
            :updated_at => "10/07/2014"
        }
    }
  

    let( :invalid_attributes ) {
        {
            :start_date_evaluation => "13/02/2014",
            :end_date_evaluation => "12/02/2014",
            :created_at => "12/10/2014",
            :updated_at => "10/11/2014"
        }
    }

    let( :valid_session ) { 
        {
            # Nothing
        } 
    }

    subject( :evaluation_period ) {
        EvaluationPeriod.new( valid_attributes )
    }

    subject( :evaluation_periods ) {
        EvaluationPeriod.all
    }

    describe "GET #index" do
        before do
            EvaluationPeriod.destroy_all
        end

        it "assigns all evaluation_period as @evaluation_period" do
            evaluation_period.save

            get :index, {}, valid_session

            expect( assigns( :evaluation_periods ) ).to eq( evaluation_periods )
        end
    end

    describe "GET #new" do
        before do
            EvaluationPeriod.destroy_all
        end

        it "assigns a new evaluation_period as @evaluation_period" do
            get :new, {}, valid_session

            expect( assigns( :evaluation_period ) ).to be_a_new( EvaluationPeriod )
        end
    end

    describe "POST #create" do
        before do
            EvaluationPeriod.destroy_all
        end

        context "with valid params" do
            it "creates a new EvaluationPeriod" do
                expect {
                  post :create, { :evaluation_period => valid_attributes }, valid_session

                }.to change( EvaluationPeriod, :count ).by( 1 )
            end

            it "assigns a newly created evaluation_period as @evaluation_period" do
                post :create, { :evaluation_period => valid_attributes }, valid_session

                expect( assigns( :evaluation_period ) ).to be_a( EvaluationPeriod )

                expect( assigns( :evaluation_period ) ).to be_persisted
            end

            it "redirects to the created evaluation_period" do
                post :create, { :evaluation_period => valid_attributes }, valid_session

                expect( response ).to redirect_to( EvaluationPeriod.last )
            end
        end
    end

    describe "PUT #update" do
        before do
            EvaluationPeriod.destroy_all
        end

        context "with valid params" do
            let( :new_attributes ) {
                {
                    :start_date_evaluation => "01/01/2014",
                    :end_date_evaluation => "23/05/2014"
                }
            }

            it "updates the requested evaluation_period" do
                evaluation_period.save

                put :update, { :id => evaluation_period.to_param, :evaluation_period => new_attributes }, valid_session
                evaluation_period.reload

                expect( assigns(:evaluation_period ) ).to eq( evaluation_period )
            end

            it "assigns the requested evaluation_period as @evaluation_period" do
                evaluation_period.save

                put :update, { :id => evaluation_period.to_param, :evaluation_period => valid_attributes }, valid_session

                expect( assigns( :evaluation_period ) ).to eq( evaluation_period )
            end

            it "redirects to the evaluation_period" do
                evaluation_period.save

                put :update, { :id => evaluation_period.to_param, :evaluation_period => valid_attributes }, valid_session

                expect( response ).to redirect_to( evaluation_period )
            end
        end
    end

    describe "DELETE #destroy" do
        before do
            EvaluationPeriod.destroy_all
        end

        it "destroys the requested evaluation_period" do
            evaluation_period.save

            expect {
                delete :destroy, { :id => evaluation_period.to_param }, valid_session

            }.to change( EvaluationPeriod, :count ).by( -1 )
        end

        it "redirects to the evaluation_period list" do
            evaluation_period.save

            delete :destroy, { :id => evaluation_period.to_param }, valid_session

            expect( response ).to redirect_to( evaluation_periods_url )
        end
    end
end
