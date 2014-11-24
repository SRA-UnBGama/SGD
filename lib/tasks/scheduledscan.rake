namespace :scheduledscan do
	task :verify_status_phases => :environment do
		EvaluationPeriod.verify_status_phases
	end

	task :verify_status_evaluation_period => :environment do
		EvaluationPeriod.verify_status_evaluation_period
	end
end