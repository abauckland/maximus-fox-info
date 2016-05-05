Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :items, :only => [:show] do
        get :show_children, :on => :member
        get :show_parents, :on => :member
        get :search, :on => :member
        get :missing_items, :on => :member
      end
      resources :products, :only => [:index, :show]
      resources :subclauses, :only => [:show]
      resources :guides, :only => [:show]
      resources :linevalues, :only => [:show]
    end
  end

end