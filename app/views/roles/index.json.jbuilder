json.array!(@roles) do |role|
  json.extract! role, :id, :nombre
  json.url role_url(role, format: :json)
end
