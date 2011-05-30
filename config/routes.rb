Rails.application.routes.draw do
  scope :module => :manage do
    resources :guides, :only => [ :create, :edit, :update, :destroy ] do
      resources :guide_links, :only => [ :new, :create, :destroy ]
    end
  end
  
  namespace :manage do
    resources :guides, :only => [ :index ]
  end
end