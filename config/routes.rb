Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root to: "processos#home"

  resources :dashboards, only: ['index']

  get 'relatorios/gerar_relatorio', to: 'relatorios#gerar_relatorio', as: :gerar_relatorio

  resources :relatorios, only: [] do
    collection do
      get :setores
      get :processos
    end
  end

  resources :processos do
    resources :riscos, only: ['new', 'create']
  end

  resources :riscos, only: ['index', 'show', 'edit', 'update', 'destroy'] do
		resources :controles, only: ['new', 'create']
  end

  resources :controles, only: ['index', 'show', 'edit', 'update', 'destroy']
end
