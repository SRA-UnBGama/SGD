every 1.day, :at => "6:00 am"  do
	rake "scheduledscan:verify_status_evaluation_period"
end

every 1.day, :at => "6:01 am"  do
	rake "scheduledscan:verify_status_phases"
end