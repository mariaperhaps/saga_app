json.array!(@sagas) do |saga|
  json.extract! saga, :id, :title, :user_id
  json.url saga_url(saga, format: :json)
end
