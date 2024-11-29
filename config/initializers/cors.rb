Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:5173", "https://menu-verse-fe.vercel.app/"
    resource "*", # Allows access to all resources
      headers: :any,
      methods: [ :get, :post, :patch, :put, :delete, :options, :head ]
  end
end
