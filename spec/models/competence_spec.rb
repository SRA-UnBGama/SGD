require 'rails_helper'

RSpec.describe Competence, :type => :model do
	
	let(:valid_attributes) {{ 
		:name => "Presta atendimento aos cidadãos,sem distinção ou preconceito, com cortesia,
		precisão e agilidade baseando-se no interesse público e nas normas internas da UnB.",
		:category => "Fundamental",
		:auto_evaluation_grade => 5,
		:pairs_evaluation_grade => 5,
		:leader_evaluation_grade  => 5,
		:is_active  => true
	}}

	let(:empty_attributes) {{
		:name => nil, 
		:category  => nil,
		:auto_evaluation_grade  => nil,
		:pairs_evaluation_grade  => nil,
		:leader_evaluation_grade  => nil,
		:is_active  => nil
	}}

	let(:invalid_attributes) {{
		:name => "", 
		:category  => nil,
		:auto_evaluation_grade  => nil,
		:pairs_evaluation_grade  => nil,
		:leader_evaluation_grade  => nil,
		:is_active  => nil
	}}

end