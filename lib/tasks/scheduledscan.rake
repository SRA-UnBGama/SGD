namespace :scheduledscan do
	task :verify_status_phases => :environment do
		EvaluationPeriod.verify_status_phases
	end
end