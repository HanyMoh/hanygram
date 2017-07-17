Rails.application.routes.draw do
  get 'profiles/show'

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile


  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts do
    resources :comments
  end
  root 'posts#index'
end
