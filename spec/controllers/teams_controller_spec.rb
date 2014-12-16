require 'rails_helper'
require 'spec_helper'

RSpec.describe TeamsController, :type => :controller do
    login_admin

    let( :valid_attributes ) {
        {
            :workplace => "PLACE_1"
        }
    }

    let( :invalid_attributes ) {
        {
            # Nothing
        }
    }

    let(:valid_session) { {} }

    subject( :team ) {
        Team.new( valid_attributes )
    }

    subject( :teams ) {
        Team.all
    }

    describe "GET #index" do
        before do
            Team.destroy_all
        end

        it "assigns all teams as @teams" do
            team.save

            get :index, {}, valid_session

            expect( assigns( :teams ) ).to eq( teams )
        end
    end

    describe "GET #show" do
        before do
            Team.destroy_all
        end

        it "assigns the requested team as @team" do
            team.save

            get :show, { :id => team.to_param }, valid_session

            expect( assigns( :team ) ).to eq( team )
        end
    end

    describe "GET #new" do
        before do
            Team.destroy_all
        end

        it "assigns a new team as @team" do
            get :new, {}, valid_session

            expect( assigns( :team ) ).to be_a_new( Team )
        end
    end

    describe "POST #create" do
        before do
            Team.destroy_all
        end

        context "with valid params" do
            it "creates a new Team" do
                expect {
                  post :create, { :team => valid_attributes }, valid_session

                }.to change( Team, :count ).by( 1 )
            end

            it "assigns a newly created team as @team" do
                post :create, { :team => valid_attributes }, valid_session

                expect( assigns( :team ) ).to be_a( Team )

                expect( assigns( :team ) ).to be_persisted
            end

            it "redirects to the created team" do
                post :create, { :team => valid_attributes }, valid_session

                expect( response ).to redirect_to( Team.last )
            end
        end
    end
end
