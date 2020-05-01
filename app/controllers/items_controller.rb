class ItemsController < ApplicationController

  # GET: /items/new
  get "/items/new" do
    erb :"/items/new"
  end

  # POST: /items
  post "/item" do
    @item = Item.new(params[:item])
    @item.restaurant_id = session[:restaurant_id]
    if @item.save
      redirect "/restaurant"
    else
      redirect "/failure"
    end

  end

  # GET: /items/5/edit
  get "/items/:id/edit" do
    erb :"/items/edit"
  end

  # PATCH: /items/5
  patch "/item/:id" do
    redirect "/restaurant"
  end

  # DELETE: /items/5/delete
  delete "/items/:id/delete" do
    redirect "/restaurant"
  end
end
