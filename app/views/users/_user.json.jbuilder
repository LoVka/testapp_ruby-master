json.extract! user, :id, :email, :password, :full_name, :address, :role, :aasm_state, :age, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
