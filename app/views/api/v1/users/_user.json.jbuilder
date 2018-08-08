json.extract! user, :id, :name, :age, :email
json.url api_v1_user_url(user, format: :json)

