# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    cart = params[:cart]
    products = Product.find(cart.keys)

    if products.nil?
      redirect_to root_path
      return
    end

    # grab the users province
    user_province = Province.find(current_user.province_id)

    gst = 0.05

    # set the tax rate
    tax_rate = (user_province.tax_rate + gst + 1)

    # calculate the total price

    line_items = []
    # creates array of hashes to represent line items in the cart
    cart.each do |id, quantity|
      # find the current product in the cart
      product = Product.find(id)
      total_price = (product.price * tax_rate).round(0)
      # create the current line item hash
      line_item = {
        name: product.product_name,
        description: product.description,
        amount: total_price,
        currency: 'cad',
        quantity: quantity
      }
      line_items << line_item
    end

    # setting up stripe session for payment
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js # renders the create.js.erb file
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    total_cost = (@session[:amount])
    @order = Order.new(
      order_number: @session[:id],
      order_date: Date.today,
      quantity: @session[:display_items].count.to_i,
      total_cost: total_cost.to_i,
      order_status_id: 2,
      user_id: current_user.id
    )

    @order.save

    session[:cart].each do |id, quantity|
      OrderProduct.create(order_id: @order.id, product_id: id, quantity: quantity)
    end
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end
end
