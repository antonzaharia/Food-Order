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

    def restaurant_logged_in?
      !!session[:restaurant_id]
    end

    def current_restaurant
      Restaurant.find_by_id(session[:restaurant_id])
    end

    def find_item_by_name(item_name)
      Item.find_by(name: item_name)
    end

    def item_from_params
      @item = Item.find_by_id(params[:id])
    end

    def order_from_params
      @order = Order.find_by_id(params[:id])
    end

    def can_edit_item?(item)
      if restaurant_logged_in? && current_restaurant.items.include?(item)
        return true
      end
    end

    def can_delete_order?(order)
      if logged_in? && current_user.orders.include?(order)
        return true
      end
    end

    def under_60_mins?(order)
      if Time.now < order.created_at + (1*60*60)
        return true
      end
    end

  end

end
