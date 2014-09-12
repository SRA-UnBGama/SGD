require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe EvaluationPeriodsController, :type => :controller do


  let(:valid_attributes) {{
    :start_date_evaluation => "21/02/2014",
    :end_date_evaluation => "23/05/2014" , :created_at => "09/10/2014",
    :updated_at => "10/07/20140"
  }}
  

  let(:invalid_attributes) {{
    :start_date_evaluation => "13/02/2014",
    :end_date_evaluation => "12/02/2014" , :created_at => "12/10/2014",
    :updated_at => "10/11/2014"
 }}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EvaluationPeriodsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all evaluation_periods as @evaluation_periods" do
      evaluation_period = EvaluationPeriod.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:evaluation_periods)).to eq([evaluation_period])
    end
  end

  describe "GET show" do
    it "assigns the requested evaluation_period as @evaluation_period" do
      evaluation_period = EvaluationPeriod.create! valid_attributes
      get :show, {:id => evaluation_period.to_param}, valid_session
      expect(assigns(:evaluation_period)).to eq(evaluation_period)
    end
  end

  describe "GET new" do
    it "assigns a new evaluation_period as @evaluation_period" do
      get :new, {}, valid_session
      expect(assigns(:evaluation_period)).to be_a_new(EvaluationPeriod)
    end
  end

  describe "GET edit" do
    it "assigns the requested evaluation_period as @evaluation_period" do
      evaluation_period = EvaluationPeriod.create! valid_attributes
      get :edit, {:id => evaluation_period.to_param}, valid_session
      expect(assigns(:evaluation_period)).to eq(evaluation_period)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EvaluationPeriod" do
        expect {
          post :create, {:evaluation_period => valid_attributes}, valid_session
        }.to change(EvaluationPeriod, :count).by(1)
      end

      it "assigns a newly created evaluation_period as @evaluation_period" do
        post :create, {:evaluation_period => valid_attributes}, valid_session
        expect(assigns(:evaluation_period)).to be_a(EvaluationPeriod)
        expect(assigns(:evaluation_period)).to be_persisted
      end

      it "redirects to the created evaluation_period" do
        post :create, {:evaluation_period => valid_attributes}, valid_session
        expect(response).to redirect_to phases_path
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved evaluation_period as @evaluation_period" do
        post :create, {:evaluation_period => invalid_attributes}, valid_session
        expect(assigns(:evaluation_period)).to be_a_new(EvaluationPeriod)
      end

      it "re-renders the 'new' template" do
        post :create, {:evaluation_period => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
    let(:valid_attributes) {{
    :start_date_evaluation => "21/02/2014",
    :end_date_evaluation => "23/05/2014" , :created_at => "09/10/2014",
    :updated_at => "10/07/20140"
  }
      }

      it "updates the requested evaluation_period" do
        evaluation_period = EvaluationPeriod.create! valid_attributes
        put :update, {:id => evaluation_period.to_param, :evaluation_period => valid_attributes}, valid_session
        evaluation_period.reload
      end

      it "assigns the requested evaluation_period as @evaluation_period" do
        evaluation_period = EvaluationPeriod.create! valid_attributes
        put :update, {:id => evaluation_period.to_param, :evaluation_period => valid_attributes}, valid_session
        expect(assigns(:evaluation_period)).to eq(evaluation_period)
      end

      it "redirects to the evaluation_period" do
        evaluation_period = EvaluationPeriod.create! valid_attributes
        put :update, {:id => evaluation_period.to_param, :evaluation_period => valid_attributes}, valid_session
        expect(response).to redirect_to(evaluation_period)
      end
    end

    describe "with invalid params" do
      it "assigns the evaluation_period as @evaluation_period" do
        evaluation_period = EvaluationPeriod.create! valid_attributes
        put :update, {:id => evaluation_period.to_param, :evaluation_period => invalid_attributes}, valid_session
        expect(assigns(:evaluation_period)).to eq(evaluation_period)
      end

      it "re-renders the 'edit' template" do
        evaluation_period = EvaluationPeriod.create! valid_attributes
        put :update, {:id => evaluation_period.to_param, :evaluation_period => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested evaluation_period" do
      evaluation_period = EvaluationPeriod.create! valid_attributes
      expect {
        delete :destroy, {:id => evaluation_period.to_param}, valid_session
      }.to change(EvaluationPeriod, :count).by(-1)
    end

    it "redirects to the evaluation_periods list" do
      evaluation_period = EvaluationPeriod.create! valid_attributes
      delete :destroy, {:id => evaluation_period.to_param}, valid_session
      expect(response).to redirect_to(evaluation_periods_url)
    end
  end

end
