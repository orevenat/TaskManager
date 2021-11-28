Rails.application.routes.draw do
  root to: 'web/boards#show'

  namespace :api do
    namespace :v1 do
      resources :tasks, only: %i[index show create update destroy]
    end
  end

  scope module: :web do
    resource :board, only: :show
    resource :session, only: %i[new create destroy]
    resources :developers, only: %i[new create]
  end

  namespace :admin do
    resources :users
  end
end
