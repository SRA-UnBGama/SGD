require 'rails_helper'
require 'spec_helper'

RSpec.describe EvaluationPeriod, :type => :model do
	CLOSED = "Encerrado"
	IN_PROGRESS = "Em Andamento"
	WAITING = "Aguardando"

	subject( :period ) {
		EvaluationPeriod.new( :start_date_evaluation => "2014-01-01", :end_date_evaluation => "2014-04-30" )
	}

	subject( :planning_phase ) {
		Phase.new( :start_date_phase => "2014-01-01", :end_date_phase => "2014-01-31", :phase_name => "Planejamento" )
	}

	subject( :monitoring_phase ) {
		Phase.new( :start_date_phase => "2014-02-01", :end_date_phase => "2014-02-28", :phase_name => "Monitoramento" )
	}

	subject( :formalization_phase ) {
		Phase.new( :start_date_phase => "2014-03-01", :end_date_phase => "2014-03-30", :phase_name => "Formalização" )
	}

	subject( :development_plan_phase ) {
		Phase.new( :start_date_phase => "2014-04-01", :end_date_phase => "2014-04-30", :phase_name => "Plano de Desenvolvimento" )
	}

	before do
		period.phases.destroy_all

		period.phases << planning_phase
		period.phases << monitoring_phase
		period.phases << formalization_phase
		period.phases << development_plan_phase
	end

	describe "#define_status_phases" do

		it "assign status phases is closed" do
			period.phases.first.start_date_phase = Date.today - 31
			period.phases.first.end_date_phase = Date.today - 1

			period.define_status_phases

			phase_status = period.phases.first.status_phase

			expect(phase_status).to eq(CLOSED)
		end

		it "assign status phases is in progress" do
			period.phases.first.start_date_phase = Date.today - 10
			period.phases.first.end_date_phase = Date.today + 10

			period.define_status_phases

			phase_status = period.phases.first.status_phase

			expect(phase_status).to eq(IN_PROGRESS)
		end

		it "assign status phases is in progress" do
			period.phases.first.start_date_phase = Date.today + 1
			period.phases.first.end_date_phase = Date.today + 30

			period.define_status_phases

			phase_status = period.phases.first.status_phase

			expect(phase_status).to eq(WAITING)
		end
	end
end