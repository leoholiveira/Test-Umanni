Rails.application.routes.draw do
  
  devise_scope :user do
    # Redirests signing out users back to sign-in
    root to: "devise/sessions#new"
    get "users", to: "devise/sessions#new"
  end
  devise_for :users
  
  scope '/admin', shallow_prefix: "admin", module: 'admin' do
    resources :dashboard, shallow: true
    resources :users, shallow: true
    post 'import-csv', to: 'users#import_csv'
  end

  scope '/client', shallow_prefix: "client", module: 'client' do
    resources :dashboard, shallow: true
    resources :users, shallow: true
  end
end
