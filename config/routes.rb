Rails.application.routes.draw do

  get '/' => 'home#index', :as => :root
  get '/:short_id' => 'home#index'

  get '/stats/:short_id' => 'home#stats'
  post '/create' => 'api#create_short_url', :as => :create_short_url
  post '/track' => 'api#track_short_url_stats', :as =>  :track_short_url_stats

end
