json.array!(@users) do |user|
  json.extract! user, :id, :name_user, :registry_user
  json.url user_url(user, format: :json)
end
