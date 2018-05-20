Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :lectures do
  #   member do
  #     get '/lectures/new'=> 'lectures#new'
  #     end
  # end
  resources :courses do |course|
    resources :lectures, :except =>[:index] do
      resources :comments, :except =>[:new, :index,:show, :edit]
    get '/lectures' => 'courses#show', as: :lectures_path
    member do
      put "like" => 'lectures#vote'
    end
    member do
      post "spam" => 'lectures#spam'
    end
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/'=>'courses#index'
  resources :users do
  #/users/:id/confirm_email
  member do
  get '/confirm_email'=> 'users#confirm_email' 
  end
  end
end
