class OrdersController < ApplicationController



  post "/orders" do
    @total = 0
    items_qunatity_hash = params.select { |item, value| value.to_i > 0 }

    items_qunatity_hash.each do |name, quantity|
      item = find_item_by_name(name)
        @total += item.price.split("$")[1].to_f*quantity.to_f if item
    end
    
    @order = Order.create(user_id: current_user.id, restaurant_id: params[:restaurant_id], total: @total)

    items_qunatity_hash.each do |name, quantity|
      item = find_item_by_name(name)
      OrderItem.create(order_id: @order.id, item_id: item.id, quantity: quantity) if item
    end

    redirect "orders/#{@order.id}" 
  end


  get "/orders/:id" do
    order_from_params
    @order_items = @order.order_items
    erb :"/orders/show"
  end

  delete "/orders/:id/delete" do
    order_from_params

    if can_delete_order?(@order)
      @order.destroy
      redirect "/#{current_user.id}/orders"
    else
      redirect '/failure'
    end
  end

  private

  def can_delete_order?(order)
    if logged_in? && current_user.orders.include?(order)
      return true
    end
  end

  def order_from_params
    @order = Order.find_by_id(params[:id])
  end

  def find_item_by_name(item_name)
    Item.find_by(name: item_name)
  end

  
end
