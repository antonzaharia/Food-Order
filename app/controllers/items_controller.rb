class ItemsController < ApplicationController

  get "/items/new" do
    if restaurant_logged_in?
      erb :"/items/new"
    else
      redirect '/failure'
    end
  end

  post "/item" do
    if params[:item][:name] == "" || params[:item][:description] == "" || params[:item][:genre] == "" || params[:item][:price] == ""
      @error = "All fields must be completed" 

      erb :'/items/new'
    else
      @item = Item.new(params[:item])
      @item.restaurant_id = session[:restaurant_id]
      if @item.save
        redirect "/index"
      else
        redirect "/failure"
      end
    end

  end

  get "/items/:id/edit" do
    item_from_params

    if can_edit_item?(@item)
      erb :"/items/edit"
    else
      redirect '/failure'
    end
  end

  patch "/item/:id" do
    item_from_params

    @item.name = params[:name]
    @item.description = params[:description]
    @item.genre = params[:genre]
    @item.price = params[:price]

    @item.save
    redirect "/index"
  end

  delete "/items/:id/delete" do
    item_from_params

    if can_edit_item?(@item)
      @item.destroy
      redirect "/index"
    else
    redirect '/failure'
    end
  end

  get "/items/:restaurant_id/:item_id" do
    @restaurant = Restaurant.find_by_id(params[:restaurant_id])
    @item = Item.find_by_id(params[:item_id])
    erb :"items/show"
  end
  
end
