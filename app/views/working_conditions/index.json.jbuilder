json.array!(@working_conditions) do |working_condition|
  json.extract! working_condition, :id, :name, :description_working_condition, :value_working_condition
  json.url working_condition_url(working_condition, format: :json)
end
