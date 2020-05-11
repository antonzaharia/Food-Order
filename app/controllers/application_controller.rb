require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    if logged_in?
      redirect '/restaurants'
    elsif restaurant_logged_in?
      redirect '/index'
    else
      erb :index
    end
  end

  get "/failure" do
    erb :failure 
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def current_restaurant
      Restaurant.find_by_id(session[:restaurant_id])
    end
  
    def restaurant_logged_in?
      !!session[:restaurant_id]
    end

    def under_60_mins?(order)
      if Time.now < order.created_at + (1*60*60)
        return true
      end
    end

  end

end
