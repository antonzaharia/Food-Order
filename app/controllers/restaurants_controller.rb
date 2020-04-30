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
end
