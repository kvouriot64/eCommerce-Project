# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart
  def index
    @products = Product.order(:product_name).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('product_name LIKE ?', "%#{params[:search]}").or(Product.where('description LIKE ?', "%#{params[:search]}%"))
                       .joins(:categories).where('categories.id = ?', params[:category])
  end

  def load_cart
    @cart = session[:cart]
  end

  def add_to_cart
    id = params[:id].to_i
    quantity = 1
    item = { id => quantity }
    session[:cart].merge!(item) unless session[:cart].include?(item)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id]
    session[:cart].delete(id)
    redirect_to root_path
  end

  def increment
    id = params[:id]
    session[:cart][id] += 1
    redirect_to root_path
  end

  def decrement
    id = params[:id]
    session[:cart][id] -= 1
    redirect_to root_path
  end

  private

  def initialize_session
    session[:cart] ||= {}
    session[:logged_in] ||= false
  end
end
