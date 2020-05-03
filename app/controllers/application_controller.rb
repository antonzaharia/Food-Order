require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  get "/failure" do
    erb :failure 
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def restaurant_logged_in?
      !!session[:restaurant_id]
    end

    def current_restaurant
      Restaurant.find(session[:restaurant_id])
    end


  end

end
