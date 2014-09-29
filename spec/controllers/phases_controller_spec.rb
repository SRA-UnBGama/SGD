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

RSpec.describe PhasesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Phase. As you add validations to Phase, be sure to
  # adjust the attributes here as well.
   let(:valid_attributes) {{
    :start_date_phase => "21/02/2014",
    :end_date_phase => "23/05/2014" , 

  }}
  

  let(:invalid_attributes) {{
    :start_date_phase => "13/02/2014",
    :end_date_phase => "12/02/2014" , 

 }}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PhasesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET edit" do
    it "assigns the requested phase as @phase" do
      phase = Phase.create! valid_attributes
      get :edit, {:id => phase.to_param}, valid_session
      expect(assigns(:phase)).to eq(phase)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
    let(:valid_attributes) {{
    :start_date_phase => "21/02/2014",
    :end_date_phase => "23/05/2014" , 
    }
        
    }
    end

    describe "with invalid params" do
      it "assigns the phase as @phase" do
        phase = Phase.create! valid_attributes
        put :update, {:id => phase.to_param, :phase => invalid_attributes}, valid_session
        expect(assigns(:phase)).to eq(phase)
      end

      it "re-renders the 'edit' template" do
        phase = Phase.create! valid_attributes
        put :update, {:id => phase.to_param, :phase => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

end
