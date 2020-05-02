class RestaurantsController < ApplicationController

  
  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'restaurants/restaurants'
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find_by_id(params[:id])
    @items = Item.all.select { |item| item.restaurant = @restaurant }
    erb :'restaurants/show'
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
    elsif Restaurant.find_by(email: params["restaurant"]["email"]) == nil
      @error = "Email not associated with any Restaurant."
      erb :'/restaurants/login'
    else
      @restaurant = Restaurant.find_by(email: params["restaurant"]["email"])
       if @restaurant && @restaurant.authenticate(params["restaurant"]["password"])
         session[:restaurant_id] = @restaurant.id

         redirect to "/restaurant"
       else
        @error = "Wrong Password"
        erb :'/restaurants/login'
       end
    end
  end

  get '/restaurant' do
    @restaurant = Restaurant.find_by_id(session[:restaurant_id])
    @items = Item.all.select { |item| item.restaurant == @restaurant }
    erb :'/restaurants/restaurant'
  end

  get '/restaurant/logout' do
    session.clear

    redirect '/'
  end

end
