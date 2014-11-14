require 'rails_helper'
require 'spec_helper'
RSpec.describe CompetencesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Competence. As you add validations to Competence, be sure to
  # adjust the attributes here as well.

  login_admin
  let(:valid_attributes) {{ :name => "Presta atendimento aos cidadãos, 
    sem distinção ou preconceito, com cortesia, precisão e agilidade baseando-se 
    no interesse público e nas normas internas da UnB", :category => "Fundamentais"

  }}

  let(:invalid_attributes) {{
    :name => "", :category => ""
  }}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompetencesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all competences as @competences" do
      competence = Competence.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:competences)).to eq([competence])
    end
  end

  describe "GET new" do
    it "assigns a new competence as @competence" do
      get :new, {}, valid_session
      expect(assigns(:competence)).to be_a_new(Competence)
    end
  end

  describe "GET edit" do
    it "assigns the requested competence as @competence" do
      competence = Competence.create! valid_attributes
      get :edit, {:id => competence.to_param}, valid_session
      expect(assigns(:competence)).to eq(competence)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Competence" do
        expect {
          post :create, {:competence => valid_attributes}, valid_session
        }.to change(Competence, :count).by(1)
      end

      it "assigns a newly created competence as @competence" do
        post :create, {:competence => valid_attributes}, valid_session
        expect(assigns(:competence)).to be_a(Competence)
        expect(assigns(:competence)).to be_persisted
      end

      it "redirects to the created competence" do
        post :create, {:competence => valid_attributes}, valid_session
        expect(response).to redirect_to(competences_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved competence as @competence" do
        post :create, {:competence => invalid_attributes}, valid_session
        expect(assigns(:competence)).to be_a_new(Competence)
      end

      it "re-renders the 'new' template" do
        post :create, {:competence => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {{ 
        :name => "Presta atendimento aos cidadãos, 
    sem distinção ou preconceito, com cortesia, precisão e agilidade baseando-se 
    no interesse público e nas normas internas da UnB", :category => "Fundamentais"

  }}


      it "updates the requested competence" do
        competence = Competence.create! valid_attributes
        put :update, {:id => competence.to_param, :competence => new_attributes}, valid_session
        competence.reload

      end

      it "assigns the requested competence as @competence" do
        competence = Competence.create! valid_attributes
        put :update, {:id => competence.to_param, :competence => valid_attributes}, valid_session
        expect(assigns(:competence)).to eq(competence)
      end

      it "redirects to the competence" do
        competence = Competence.create! valid_attributes
        put :update, {:id => competence.to_param, :competence => valid_attributes}, valid_session
        expect(response).to redirect_to(competences_path)
      end
    end

    describe "with invalid params" do
      it "assigns the competence as @competence" do
        competence = Competence.create! valid_attributes
        put :update, {:id => competence.to_param, :competence => invalid_attributes}, valid_session
        expect(assigns(:competence)).to eq(competence)
      end

      it "re-renders the 'edit' template" do
        competence = Competence.create! valid_attributes
        put :update, {:id => competence.to_param, :competence => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "redirects to the competences list" do
      competence = Competence.create! valid_attributes
      delete :destroy, {:id => competence.to_param}, valid_session
      expect(response).to redirect_to(competences_url)
    end
  end

end
