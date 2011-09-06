KimiBlog::Application.routes.draw do
  root :to => "home#index"

  resources :messages do
    collection do
      get 'messages_list'
      post 'comment'
    end
  end

  resources :blogs do
    collection do
      get 'blogs_list'
      post 'comment'
    end
  end

  namespace :admin do
    root :to => 'index#index'
    match '/login' => 'index#login'
    match '/logout' => 'index#logout'
    match '/validate_user' => 'index#validate_user'
    
    resources :blogs do
      collection do
        post 'get_blogs'
        post 'destroy_list'
        get 'tags_list'
        post 'get_tags'
        post 'destroy_tags'
      end
    end
    resources :messages do
      collection do
        post 'get_messages'
        post 'destroy_list'
        post 'get_messages_with_blog'
      end
    end
    resources :admins do
      collection do
        post 'get_admins'
        post 'destroy_list'
      end
    end
  end

  match ':controller(/:action(/:id(.:format)))'
end
