class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    product = Product.find_by(id: params["product_id"])
    subtotal = product.price * params["quantity"].to_i 
    tax = subtotal * 0.09
    total = subtotal + tax
    if current_user
    @order = Order.new({
      product_id: params["product_id"],
      quantity: params["quantity"],
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    })
      if @order.save
        render "show.json.jb"
      else
        render json: { message: "Order did not save."}
      end
    else
      render json: { message: "Please log in first"}
    end
  end

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def show
    @order = Order.find_by(id: params["id"])
    if @order.user_id == current_user.id  
    render "show.json.jb"
    else
      render json: { message: "not your order"}
    end
  end




end
