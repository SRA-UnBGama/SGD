require 'rails_helper'
require 'spec_helper'

RSpec.describe LearningSolutionsController, :type => :controller do

  login_admin

  # This should return the minimal set of attributes required to create a valid
  # LearningSolution. As you add validations to LearningSolution, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      :description => "Fazer curso de excel", :category => "Excel"
    }
  }

  let(:invalid_attributes) {
    {
      :description => "", :category => ""
    }
  }

  let(:valid_attributes_period) {
    {
      :start_date_evaluation => "01/01/2014",
      :end_date_evaluation => "30/12/2014",
      :created_at => "09/10/2014",
      :updated_at => "10/07/2014"
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LearningSolutionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  subject( :learning_solution ) {
      LearningSolution.new( valid_attributes )
  }

  subject( :evaluation_period ){
    EvaluationPeriod.new( valid_attributes_period )
  }

  describe "GET #index" do

    before do
        LearningSolution.destroy_all
    end

    it "assigns all learning solutions as @learning_solutions" do
        learning_solution.save

        get :index, {}, valid_session

        expect( assigns( :learning_solutions ) ).to match( LearningSolution.all )
    end
  end

  describe "GET new" do
    it "assigns a new learning_solution as @learning_solution" do
      get :new, {}, valid_session
      expect(assigns(:learning_solution)).to be_a_new(LearningSolution)
    end

    it "assings a new learning_solution on planning phase" do
      evaluation_period.status_evaluation_period = "Em Andamento"
      get :new, {}, valid_session
      expect(assigns(:learning_solution)).to be_a_new(LearningSolution)
    end
  end

  describe "GET edit" do
    it "assigns the requested learning_solution as @learning_solution" do
      learning_solution = LearningSolution.create! valid_attributes
      get :edit, {:id => learning_solution.to_param}, valid_session
      expect(assigns(:learning_solution)).to eq(learning_solution)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LearningSolution" do
        expect {
          post :create, {:learning_solution => valid_attributes}, valid_session
        }.to change(LearningSolution, :count).by(1)
      end

      it "assigns a newly created learning_solution as @learning_solution" do
        post :create, {:learning_solution => valid_attributes}, valid_session
        expect(assigns(:learning_solution)).to be_a(LearningSolution)
        expect(assigns(:learning_solution)).to be_persisted
      end

      it "redirects to the created learning_solution" do
        post :create, {:learning_solution => valid_attributes}, valid_session
        expect(response).to redirect_to(learning_solutions_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved learning_solution as @learning_solution" do
        post :create, {:learning_solution => invalid_attributes}, valid_session
        expect(assigns(:learning_solution)).to be_a_new(LearningSolution)
      end

      it "re-renders the 'new' template" do
        post :create, {:learning_solution => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested learning_solution" do
        learning_solution = LearningSolution.create! valid_attributes
        put :update, {:id => learning_solution.to_param, :learning_solution => new_attributes}, valid_session
        learning_solution.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested learning_solution as @learning_solution" do
        learning_solution = LearningSolution.create! valid_attributes
        put :update, {:id => learning_solution.to_param, :learning_solution => valid_attributes}, valid_session
        expect(assigns(:learning_solution)).to eq(learning_solution)
      end

      it "redirects to the learning_solution" do
        learning_solution = LearningSolution.create! valid_attributes
        put :update, {:id => learning_solution.to_param, :learning_solution => valid_attributes}, valid_session
        expect(response).to redirect_to(learning_solutions_path)
      end
    end

    describe "with invalid params" do
      it "assigns the learning_solution as @learning_solution" do
        learning_solution = LearningSolution.create! valid_attributes
        put :update, {:id => learning_solution.to_param, :learning_solution => invalid_attributes}, valid_session
        expect(assigns(:learning_solution)).to eq(learning_solution)
      end

      it "re-renders the 'edit' template" do
        learning_solution = LearningSolution.create! valid_attributes
        put :update, {:id => learning_solution.to_param, :learning_solution => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do

    it "destroys the requested learning_solution" do
      learning_solution = LearningSolution.create! valid_attributes
      expect {
        delete :destroy, {:id => learning_solution.to_param}, valid_session
      }.to change(LearningSolution, :count).by(0)
    end

    it "redirects to the learning_solutions list" do
      learning_solution = LearningSolution.create! valid_attributes
      delete :destroy, {:id => learning_solution.to_param}, valid_session
      expect(response).to redirect_to(learning_solutions_url)
    end

  end

end
