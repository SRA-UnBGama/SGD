require 'rails_helper'
require 'spec_helper'

=begin
	Sets all unit tests for the model Competence
=end
RSpec.describe Competence, :type => :model do
	
	# Assigns the symbol :valid_attributes a hash with values considered valid for a Competence.
	let(:valid_attributes) {{ 
		:name => "Presta atendimento aos cidadãos,sem distinção ou preconceito, com cortesia,
		precisão e agilidade baseando-se no interesse público e nas normas internas da UnB.",
		:category => "Fundamental",
		:auto_evaluation_grade => 5,
		:pairs_evaluation_grade => 5,
		:leader_evaluation_grade  => 5,
		:is_active  => true
	}}

	# Assigns the symbol :valid_attributes a hash with values considered invalid for a Competence.
	let(:invalid_attributes) {{
		:name => nil, 
		:category  => nil,
		:auto_evaluation_grade  => nil,
		:pairs_evaluation_grade  => nil,
		:leader_evaluation_grade  => nil,
		:is_active  => nil
	}}

	# All tests in this block are related to the validation method max_number_of_competence.
	describe "#max_number_of_competence" do
		before( :all ) do
			Competence.destroy_all
		end

		it "passes validation of number of active Competence" do
			for i in 1..9
				Competence.create( valid_attributes )
			end

			competence = Competence.create( valid_attributes )
			competence.valid?

			expect( competence.errors[:name] ).not_to(
				include( "O número de competências ativas deve ser menor que 10." ))
		end

		it "not passes validation of number of active Competence" do
			for i in 1..10
				Competence.create( valid_attributes )
			end

			competence = Competence.create( valid_attributes )
			competence.valid?

			expect( competence.errors[:name] ).to(
				include( "O número de competências ativas deve ser menor que 10." ))
		end

		after do
			Competence.destroy_all
		end
	end
end