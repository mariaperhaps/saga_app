json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :about_me, :image_url, :gender, :city, :state, :country
  json.url user_url(user, format: :json)
end
