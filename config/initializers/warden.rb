Warden::Strategies.add(:password) do
  def valid?
    params['email'] || params['password']
  end

  def authenticate!
    u = User.authenticate(params['email'], params['password'])
    u.nil? ? fail!("Could not log in") : success!(u)
  end
end

Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.failure_app = Proc.new { |_env|
    ['401', {'Content-Type' => 'application/json'}, ['Unathorized']]
  }
  manager.default_strategies :password # needs to be defined
end
