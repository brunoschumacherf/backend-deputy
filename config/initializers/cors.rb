# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001'  # Adicione o endereço do seu frontend

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :delete, :options],
      credentials: true
  end
end
