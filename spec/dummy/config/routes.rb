Dummy::Application.routes.draw do
  resources :lost_souls, :only => [ :show ]
  
  get '/guide_preview' => 'dummy_front#show_guide'
end
