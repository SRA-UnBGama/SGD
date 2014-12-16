require 'rails_helper'
require 'spec_helper'

RSpec.describe Phase, :type => :model do

	describe '#dates_are_valid' do

		it "passes a valid date" do
			phase = Phase.new( :start_date_phase => "2014-09-22", :end_date_phase => "2014-09-23")
			phase.valid?

			expect(phase.errors[:end_date_phase]).not_to(
				include("A data final deve ser após a data de início do intervalo."))
		end

		it "passes a invalid date" do
			phase = Phase.new( :start_date_phase => "2014-09-24", :end_date_phase => "2014-09-23")
			phase.valid?

			expect(phase.errors[:end_date_phase]).to(
				include("A data final deve ser após a data de início do intervalo."))
		end

	end

	describe '#verify_inside_period' do

		it "phase is inside a period" do
			period = EvaluationPeriod.new( :start_date_evaluation => "2014-09-23", :end_date_evaluation => "2014-09-24" )
			phase = Phase.new( :start_date_phase => "2014-09-23", :end_date_phase => "2014-09-24", :evaluation_period => period )
			phase.valid?

			expect(phase.errors[:start_date_phase]).not_to(
				include("A fase deve estar contida no período de avaliação."))
		end

		it "phases is not inside a period" do
			period = EvaluationPeriod.new( :start_date_evaluation => "2014-09-23", :end_date_evaluation => "2014-09-24" )
			phase = Phase.new( :start_date_phase => "2014-09-22", :end_date_phase => "2014-09-23", :evaluation_period => period )
			phase.valid?

			expect(phase.errors[:start_date_phase]).to(
				include("A fase deve estar contida no período de avaliação."))
		end

	end

	describe '#not_overlap_phases' do

		subject (:period) {
			EvaluationPeriod.new( :start_date_evaluation => "2014-09-23", :end_date_evaluation => "2015-01-27" )
		}

		subject (:planning_phase) {
			Phase.new( :start_date_phase => "2014-09-23", :end_date_phase => "2014-10-24", :phase_name => "Planejamento" )
		}

		subject (:monitoring_phase) {
			Phase.new( :start_date_phase => "2014-10-24", :end_date_phase => "2014-11-25", :phase_name => "Acompanhamento" )
		}

		subject (:formalization_phase) {
			Phase.new( :start_date_phase => "2014-11-25", :end_date_phase => "2014-12-26", :phase_name => "Formalização" )
		}

		subject (:development_plan_phase) {
			Phase.new( :start_date_phase => "2014-12-26", :end_date_phase => "2015-01-27", :phase_name => "Plano de Desenvolvimento")
		}

		before do
			period.phases.destroy_all
			period.phases << planning_phase
			period.phases << monitoring_phase
			period.phases << formalization_phase
			period.phases << development_plan_phase

			planning_phase.evaluation_period = period

			period.save
		end

		it "planning phases is overlap" do
			planning_phase.end_date_phase = "2015-10-25"
			planning_phase.valid?

			expect(planning_phase.errors[:end_date_phase]).to(
				include("O período da fase de Planejamento não deve sobrepor o período da fase de Acompanhamento."))
		end

		it "planning phases is not overlap" do
			planning_phase.valid?

			expect(planning_phase.errors[:end_date_phase]).not_to(
				include("O período da fase de Planejamento não deve sobrepor o período da fase de Acompanhamento."))
		end

		it "monitoring phase is overlap start date" do
			monitoring_phase.start_date_phase = "2014-10-22"
			monitoring_phase.valid?

			expect(monitoring_phase.errors[:end_date_phase]).to(
				include("O período da fase de Acompanhamento não deve sobrepor o período da fase de Planejamento ou de Formalização."))
		end

		it "monitoring phase is overlap end date" do
			monitoring_phase.end_date_phase = "2014-11-27"
			monitoring_phase.valid?

			expect(monitoring_phase.errors[:end_date_phase]).to(
				include("O período da fase de Acompanhamento não deve sobrepor o período da fase de Planejamento ou de Formalização."))
		end

		it "monitoring phase is not overlap" do
			monitoring_phase.valid?

			expect(monitoring_phase.errors[:end_date_phase]).not_to(
				include("O período da fase de Acompanhamento não deve sobrepor o período da fase de Planejamento ou de Formalização."))
		end

		it "formalization phase is overlap start date" do
			formalization_phase.start_date_phase = "2014-11-24"
			formalization_phase.valid?

			expect(formalization_phase.errors[:end_date_phase]).to(
				include("O período da fase de Formalização não deve sobrepor o período da fase de Acompanhamento ou de Plano de Desenvolvimento."))
		end

		it "formalization phase is overlap end date" do
			formalization_phase.end_date_phase = "2014-12-27"
			formalization_phase.valid?

			expect(formalization_phase.errors[:end_date_phase]).to(
				include("O período da fase de Formalização não deve sobrepor o período da fase de Acompanhamento ou de Plano de Desenvolvimento."))
		end

		it "formalization phase is not overlap" do
			formalization_phase.valid?

			expect(formalization_phase.errors[:end_date_phase]).not_to(
				include("O período da fase de Formalização não deve sobrepor o período da fase de Acompanhamento ou de Plano de Desenvolvimento."))
		end

		it "development plan phase is overlap start date" do
			development_plan_phase.start_date_phase = "2014-12-25"
			development_plan_phase.valid?

			expect(development_plan_phase.errors[:end_date_phase]).to(
				include("O período da fase de Plano de Desenvolvimento não deve sobrepor o período da fase de Formalização."))
		end

		it "development plan phase is not overlap end date" do
			development_plan_phase.end_date_phase = "2015-01-28"
			development_plan_phase.valid?

			expect(development_plan_phase.errors[:end_date_phase]).not_to(
				include("O período da fase de Plano de Desenvolvimento não deve sobrepor o período da fase de Formalização."))
		end

	end

end