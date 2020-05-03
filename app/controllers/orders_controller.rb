class OrdersController < ApplicationController



  # POST: /orders
  post "/orders" do
    @order_items = []
    params.select do |item, value| 
      if value == "on"
        @order_items << item
      end
    end
    erb :'/orders/new'
  end


  post "/orders/show" do
    @order = Order.create(user_id: session[:user_id], restaurant_id: params[:restaurant_id], total: params[:total])
    params.each do |key, value|
      if value == "item_id_quantity"
        ii = key.split("-")[0].to_i
        q = key.split("-")[1].to_i.to_s
        OrderItem.create(order_id: @order.id, item_id: ii, quantity: q)
        
      end
    end
    @order_items = OrderItem.all.select {|order_items| order_items.order_id == @order.id}
    
    erb :'orders/show'
  end

  # GET: /orders/5 
  get "/orders/:id" do
    @order = Order.find_by_id(params[:id])
    @order_items = OrderItem.all.select {|order_items| order_items.order == @order}
    erb :"/orders/show"
  end

  # DELETE: /orders/5/delete
  delete "/orders/:id/delete" do
    @order = Order.find_by_id(params[:id])
    @order.destroy
    
    redirect "/orders"
  end
end
