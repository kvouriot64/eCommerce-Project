# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    cart = params[:cart]
    products = Product.find(cart.keys)

    if products.nil?
      redirect_to root_path
      return
    end

    line_items = []
    # creates array of hashes to represent line items in the cart
    cart.each do |id, quantity|
      # find the current product in the cart
      product = Product.find(id)
      # create the current line item hash
      line_item = {
        name: product.product_name,
        description: product.description,
        amount: product.price,
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
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end
end
