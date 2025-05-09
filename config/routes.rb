Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :csv_uploads, only: [:index, :show]
      resources :deputies, only: [:show]

      post 'upload', to: 'uploads#create'
    end
  end
end
