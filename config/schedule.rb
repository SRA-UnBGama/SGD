every 1.day :at=> "6:00 am"  do
	rake "scheduledscan:verify_status_phases"
end