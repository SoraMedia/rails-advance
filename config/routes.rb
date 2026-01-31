Rails.application.routes.draw do
  # 公開側
  scope module: :public do
    resources :events, only: %i[index show]
  end

  # 管理側
  namespace :admin do
    resources :events
    resource :sessions, only: %i[new create destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
