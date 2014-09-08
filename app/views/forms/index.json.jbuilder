json.array!(@forms) do |form|
  json.extract! form, :id, :date
  json.url form_url(form, format: :json)
end
