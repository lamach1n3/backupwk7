Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  get 'pages/residential'
  get 'pages/commercial'
  get 'pages/404'
  get 'quotes/quotes'
  devise_for :users

  root to: "home#index"
  
  get '/commercial'    => 'pages#commercial'
  get "/home"         => 'home#index'
  get '/404'        => 'pages#404'
  get '/quotes'        =>  'quotes#quotes'
  get '/residential'  => 'pages#residential'
  # get '/charts'       => 'pages#charts'
  # get '/diagram'      => 'pages#diagram'``
  get '/news'         => 'home#news'
  get '/clients'      => 'home#clients'
  get '/contact'     => 'contact#index'
  get '/portfolio'  => 'home#portfolio'
  # post '/leads'       => 'leads#create'
  post "/quotes"      => "quotes#create"
  
   
  devise_scope :user do 
    get "/signup" => "devise/registrations#new" 
    get "/signin" => "devise/sessions#new" 
    get "/signout" => "devise/sessions#destroy"
  end

  Rails.application.routes.draw do
    resources :quotes, only: [:new, :create]
  end
end