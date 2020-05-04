class ItemsController < ApplicationController

  # GET: /items/new
  get "/items/new" do
    erb :"/items/new"
  end

  # POST: /items
  post "/item" do
    if params[:item][:name] == "" || params[:item][:description] == "" || params[:item][:genre] == "" || params[:item][:price] == ""
      @error = "All fields must be completed" 

      erb :'/items/new'
    else
      @item = Item.new(params[:item])
      @item.restaurant_id = session[:restaurant_id]
      if @item.save
        redirect "/restaurant"
      else
        redirect "/failure"
      end
    end

  end

  # GET: /items/5/edit
  get "/items/:id/edit" do
    @item = Item.find_by_id(params[:id])

    erb :"/items/edit"
  end

  # PATCH: /items/5
  patch "/item/:id" do
    @item = Item.find_by_id(params[:id])
    @item.name = params[:name]
    @item.description = params[:description]
    @item.genre = params[:genre]
    @item.price = params[:price]

    @item.save
    redirect "/restaurant"
  end

  # DELETE: /items/5/delete
  delete "/items/:id/delete" do
    @item = Item.find_by_id(params[:id])
    @item.destroy
    
    redirect "/restaurant"
  end
end
