json.array!(@phases) do |phase|
  json.extract! phase, :id, :start_date_phase, :end_date_phase, :status_phase
  json.url phase_url(phase, format: :json)
end
