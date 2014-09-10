json.array!(@goals) do |goal|
  json.extract! goal, :id, :name_goal, :description_goal, :value_goal
  json.url goal_url(goal, format: :json)
end
