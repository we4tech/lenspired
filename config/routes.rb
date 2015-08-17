Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  root 'home#index'

  namespace :users do
    resources :stories, controller: 'stories' do
      member do
        get :slug
      end
    end
  end

end
