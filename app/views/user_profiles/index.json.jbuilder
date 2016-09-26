json.array!(@user_profiles) do |user_profile|
  json.extract! user_profile, :id, :nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :domicilio
  json.url user_profile_url(user_profile, format: :json)
end
