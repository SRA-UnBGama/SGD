json.array!(@working_conditions) do |working_condition|
  json.extract! working_condition, :id, :name_working_condition, :description_working_condition, :value_working_condition
  json.url working_condition_url(working_condition, format: :json)
end
