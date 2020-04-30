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


  post "/order-confirmed" do
    @order = Order.create(user_id: session[:user_id], restaurant_id: params[:restaurant_id], total: params[:total])
    params.each do |key, value|
      if value == "item_id"
        OrderItem.create(order_id: @order.id, item_id: key)
      end
    end
    @order_items = OrderItem.all.select {|order_items| order_items.order_id == @order.id}
    

    erb :'orders/show'
  end


  # GET: /orders/5
  get "/orders/:id" do
    erb :"/orders/show.html"
  end

  # GET: /orders/5/edit
  get "/orders/:id/edit" do
    erb :"/orders/edit.html"
  end

  # PATCH: /orders/5
  patch "/orders/:id" do
    redirect "/orders/:id"
  end

  # DELETE: /orders/5/delete
  delete "/orders/:id/delete" do
    redirect "/orders"
  end
end
