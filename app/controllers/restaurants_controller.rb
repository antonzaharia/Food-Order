class RestaurantsController < ApplicationController

  
  get '/restaurants' do
    if logged_in?
      @restaurants = Restaurant.all
      erb :'/restaurants/restaurants'
    else
      redirect '/failure'
    end
  end

  get '/restaurants/:id' do
    if logged_in?
      @restaurant = Restaurant.find_by_id(params[:id])
      @items = @restaurant.items
      erb :'/orders/new'
    else
      redirect '/failure'
    end
  end

  get '/restaurant/signup' do
    erb :'/restaurants/signup'
 end

  post '/restaurant/signup' do

     @restaurant = Restaurant.new(params[:restaurant])
     
     if Restaurant.find_by(:email => @restaurant.email)
      @error = "This email already in use."
      erb :'/restaurants/signup'
    else
      if @restaurant.save
        redirect '/restaurant/login'
      else
        @error = "Must include your Restaurant name, genre, email and a password."
        erb :'/restaurants/signup'
      end
    end
  end

  get '/restaurant/login' do 
    erb :'/restaurants/login'
  end

  post '/restaurant/login' do

    if params["restaurant"]["email"].empty? || params["restaurant"]["password"].empty?
      @error = "Email and password cannot be blank."
      erb :'/restaurants/login'
    elsif restaurant_from_params == nil
      @error = "Email not associated with any Restaurant."
      erb :'/restaurants/login'
    else
      @restaurant = restaurant_from_params
       if @restaurant && @restaurant.authenticate(params["restaurant"]["password"])
         session[:restaurant_id] = @restaurant.id

         redirect to "/index"
       else
        @error = "Wrong Password"
        erb :'/restaurants/login'
       end
    end
  end

  get '/index' do
    if restaurant_logged_in?
      @items = current_restaurant.items
      erb :'/restaurants/index'
    else
      redirect '/failure'
    end
  end

  get '/restaurant/logout' do
    session.clear
    redirect '/'
  end

  get '/restaurant/orders' do 
      @orders = current_restaurant.orders
      erb :'/restaurants/orders'
  end

private

  def restaurant_from_params
    Restaurant.find_by(email: params["restaurant"]["email"])
  end


end
