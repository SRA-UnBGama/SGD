json.array!(@evaluation_periods) do |evaluation_period|
  json.extract! evaluation_period, :id, :start_date_evaluation, :end_date_evaluation
  json.url evaluation_period_url(evaluation_period, format: :json)
end
